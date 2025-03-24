import {defineStore} from 'pinia';
import {useLocalStorage} from "@vueuse/core";
import {reactive, toRefs, watch} from "vue";


export const useStyleStore = defineStore('styleStore', () => {

            const defaultHighlightColor = '#17a095';
            const defaultFontSize = 11
            const defaultMargin = 0.75;
            const defaultStyle = {
                deleteme: "23",
                highlightColor: defaultHighlightColor,
                fontSize: defaultFontSize,
                marginTop: defaultMargin,
                marginBottom: defaultMargin,
                marginLeft: defaultMargin,
                marginRight: defaultMargin,
                hiddenSections: []
            }

            const customCSS = useLocalStorage('json-resume-custom-css', '');

            const style = reactive(Object.fromEntries(
                Object.entries(defaultStyle).map(([key, defaultValue]) => {
                    const keyIdentifier = `${key.replace(/([A-Z])/g, '-$1')}`.toLowerCase()
                    const styleRef = useLocalStorage(`resume-builder-${keyIdentifier}`, defaultValue);

                    watch(styleRef, (value) => {
                        const cssVariable = `--c-resume-builder-${keyIdentifier}`;
                        document.documentElement.style.setProperty(cssVariable, value ?? '');
                    }, {immediate: true});

                    return [key, styleRef];
                })
            ));


            function importStyle(newStyle) {
                const mergedStyle = newStyle ? { ...defaultStyle, ...newStyle } : defaultStyle;
                Object.assign(style,mergedStyle)
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
                customCSS,
                importStyle,
                resetHighlightColor,
                resetMargins
            };
        }
    )
;