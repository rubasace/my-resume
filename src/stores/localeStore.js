import {computed, nextTick, ref, watch} from 'vue'
import { defineStore } from 'pinia'
import {createI18n} from "vue-i18n";
import {useDataStore} from "@/stores/dataStore";

export const useLocaleStore = defineStore('localeStore', () => {
    const DEFAULT_LANGUAGE = "en";
    const localeModules = import.meta.glob('@/i18n/locales/*.json')

    const supportedLocales = Object.keys(localeModules)
        .map((path) => path.match(/\/src\/i18n\/locales\/(.*)\.json$/)?.[1])
        .filter(Boolean)
        .sort()

    const dataStore = useDataStore()
    // const appLocale = useLocalStorage('resume-builder-app-locale', undefined)
    // TODO change when we translate the menus
    const appLocale = ref(DEFAULT_LANGUAGE)
    const resumeLocale = computed(() => dataStore.data.language)

    // TODO use localstorage and resume data
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

    function getAppMessage(key) {
        return computed(() => {
            return appI18n.value?.global?.t(key) ?? key
        })
    }
    function getResumeMessage(key) {
        return computed(() => {
            return resumeI18n.value?.global?.t(key) ?? key
        })
    }

    async function setupI18n(locale, htmlSelector = 'html') {
        const i18n = createI18n({
            legacy: false,
            fallbackLocale: DEFAULT_LANGUAGE
        })
        await setI18nLanguage(i18n, locale ?? navigator.language, htmlSelector)
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
        if(!locale){
            return DEFAULT_LANGUAGE
        }
        if(supportedLocales.includes(locale)){
            return locale
        }
        const langLocale = locale.split('-')[0]
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
        appLocale,
        getResumeMessage,
        getAppMessage,
        supportedLocales
    }
})