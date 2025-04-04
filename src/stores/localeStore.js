import {computed, nextTick, ref, watch} from 'vue'
import {defineStore} from 'pinia'
import {createI18n} from "vue-i18n";
import {useDataStore} from "@/stores/dataStore";
import {useLocalStorage} from "@vueuse/core";

export const useLocaleStore = defineStore('localeStore', () => {
    const DEFAULT_LANGUAGE = "en";
    const localeModules = import.meta.glob('@/i18n/locales/*.json')

    const supportedLocales = Object.keys(localeModules)
        .map((path) => path.match(/\/src\/i18n\/locales\/(.*)\.json$/)?.[1])
        .filter(Boolean)
        .sort()

    const dataStore = useDataStore()
    // TODO change when we translate the menus
    const appLocale = useLocalStorage('resume-builder-app-locale', undefined)
    const resumeLocale = computed(() => dataStore.data.language)

    const appI18n = ref(null)
    const resumeI18n = ref(null)

    setupI18n(appLocale.value).then(e => appI18n.value = e)
    setupI18n(resumeLocale.value, '.resume').then(e => resumeI18n.value = e)

    watch(appLocale, async (newLocale) => {
        appI18n.value = await setupI18n(newLocale)
    })

    watch(resumeLocale, async (newLocale) => {
        resumeI18n.value = await setupI18n(newLocale, '.resume')
    })

    function getAppMessage(key, ...args) {
        return computed(() => {
            return appI18n.value?.global?.t(key, args) ?? key
        })
    }

    function getResumeMessage(key, ...args) {
        return computed(() => {
            return resumeI18n.value?.global?.t(key, args) ?? key
        })
    }

    async function setupI18n(locale, htmlSelector = 'html') {
        const i18n = createI18n({
            legacy: false,
            fallbackLocale: DEFAULT_LANGUAGE
        })
        await loadLocaleMessages(i18n, DEFAULT_LANGUAGE)
        await setI18nLanguage(i18n, locale, htmlSelector)
        return i18n
    }

    async function setI18nLanguage(i18n, locale, htmlSelector = 'html') {
        const normalizedLocale = normalizeLocale(locale)
        await loadLocaleMessages(i18n, normalizedLocale)
        if (i18n.mode === 'legacy') {
            i18n.global.locale = normalizedLocale
        } else {
            i18n.global.locale.value = normalizedLocale
        }
        document.querySelector(htmlSelector)?.setAttribute('lang', normalizedLocale)
    }

    function normalizeLocale(locale) {

        const targetLocale = locale ?? navigator.language ?? DEFAULT_LANGUAGE

        if(supportedLocales.includes(targetLocale)){
            return targetLocale
        }
        const langLocale = targetLocale.split('-')[0]
        if(supportedLocales.includes(langLocale)){
            return langLocale
        }
        return DEFAULT_LANGUAGE
    }

    async function loadLocaleMessages(i18n, locale) {
        if (i18n.global.availableLocales.includes(locale)) {
            return nextTick()
        }
        const localeKey = `/src/i18n/locales/${locale}.json`

        const load = localeModules[localeKey]
        if (!load) throw new Error(`Locale "${locale}" not found`)

        const messages = await load()
        i18n.global.setLocaleMessage(locale, messages.default)

        return nextTick()
    }

    return {
        appI18n,
        appLocale,
        getAppMessage,
        getResumeMessage,
        supportedLocales
    }
})