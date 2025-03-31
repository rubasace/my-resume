import {defineStore} from 'pinia';
import {useLocalStorage} from "@vueuse/core";
import {computed, nextTick, reactive, toRefs, watch} from "vue";
import WebFont from "webfontloader";
import {useDataStore} from "@/stores/dataStore";


export const useStyleStore = defineStore('styleStore', () => {

    const dataStore = useDataStore()

    const defaultHighlightColor = '#17a095';
    const defaultFontSize = 11
    const defaultMargin = 0.75;
    const defaultSortedSections = ['work', 'projects', 'publications', 'conferences', 'education', 'certificates', 'skills', 'awards', 'interests', 'languages']

    const defaultStyle = {
        highlightColor: defaultHighlightColor,
        fontSize: defaultFontSize,
        marginTop: defaultMargin,
        marginBottom: defaultMargin,
        marginLeft: defaultMargin,
        marginRight: defaultMargin,
        pictureScale: 1,
        pictureTranslateX: 0,
        pictureTranslateY: 0,
        hiddenSections: [],
        sortedSections: defaultSortedSections,
        showIcons: true,
        showTimeline: true,
        theme: 'rub'
    }

    const customCSS = useLocalStorage('resume-builder-custom-css', '');

    const style = reactive(Object.fromEntries(Object.entries(defaultStyle).map(([key, defaultValue]) => {
        const keyIdentifier = `${key.replace(/([A-Z])/g, '-$1')}`.toLowerCase()
        const styleRef = useLocalStorage(`resume-builder-${keyIdentifier}`, defaultValue);

        watch(styleRef, (value) => {
            const cssVariable = `--c-resume-builder-${keyIdentifier}`;
            document.documentElement.style.setProperty(cssVariable, value?.label ?? value ?? '');
        }, {immediate: true});

        return [key, styleRef];
    })));

    const visibleSections = computed(() => style.sortedSections.filter(section => !style.hiddenSections?.includes(section) && dataStore.data[section]?.filter(e => !e.hidden).length))


    function importStyle(newStyle) {
        const mergedStyle = newStyle ? {...defaultStyle, ...newStyle} : defaultStyle;
        Object.assign(style, mergedStyle)
    }


    function resetHighlightColor() {
        style.highlightColor = defaultHighlightColor
    }

    function resetMargins() {
        style.marginTop = defaultMargin;
        style.marginBottom = defaultMargin;
        style.marginLeft = defaultMargin;
        style.marginRight = defaultMargin;
    }

    watch(() => customCSS.value, (css) => {
        const styleId = 'cv-builder-custom-css-style'
        let styleSheet = document.getElementById(styleId);
        if (!styleSheet) {
            styleSheet = document.createElement("style");
            styleSheet.id = styleId;
            document.head.appendChild(styleSheet);
        }
        styleSheet.innerHTML = css;
    }, {immediate: true});


    return {
        style: toRefs(style),
        visibleSections,
        customCSS,
        importStyle,
        resetHighlightColor,
        resetMargins
    };
});