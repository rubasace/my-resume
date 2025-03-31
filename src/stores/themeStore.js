import {defineStore} from 'pinia'
import {useLocalStorage} from "@vueuse/core";
import {nextTick, watch} from "vue";

import.meta.glob('@/assets/themes/*.sass', { eager: true })


export const useThemeStore = defineStore('themeStore', () => {
    const DEFAULT_THEME = "rub";
    const themeModules = import.meta.glob('@/assets/themes/*.sass', {as: 'raw', eager: true})

    const availableThemes = Object.keys(themeModules)
        .map((path) => path.match(/\/src\/assets\/themes\/(.*)\.sass$/)?.[1])
        .filter(Boolean)
        .sort()

    const selectedTheme = useLocalStorage('resume-builder-selected-theme', DEFAULT_THEME)

    function applyTheme(themeName, selector) {
        const elements = document.querySelectorAll(selector)

        elements.forEach((el) => {
            // Remove existing theme-* classes
            el.classList.forEach((cls) => {
                if (cls.startsWith('theme-')) el.classList.remove(cls)
            })

            // Add the new theme class
            el.classList.add(`theme-${themeName}`)
        })
    }

    watch(selectedTheme, (newTheme) => {
        nextTick(() => applyTheme(newTheme, '.view .resume'))
    }, { immediate: true })

    return {
        availableThemes,
        selectedTheme
    }
})