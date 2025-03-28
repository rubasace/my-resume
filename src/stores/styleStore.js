import {defineStore} from 'pinia';
import {useLocalStorage} from "@vueuse/core";
import {nextTick, reactive, toRefs, watch} from "vue";
import fonts from "google-fonts-complete";
import WebFont from "webfontloader";


export const useStyleStore = defineStore('styleStore', () => {

            const availableFonts = Object.entries(fonts).map(([name, data]) => {
                const normalVariants = data.variants?.normal ?? {};
                const italicVariants = data.variants?.italic ?? {};

                const normalWeights = extractWeights(normalVariants);
                const italicWeights = extractWeights(italicVariants);

                // Prioritize normal weights
                const preferredWeights = normalWeights.length > 0
                    ? normalWeights
                    : italicWeights;

                // Use common weights if available
                const commonWeights = ["300", "400", "700"];
                const selectedWeights = commonWeights.filter(w => preferredWeights.includes(w));
                const weightsToUse = selectedWeights.length > 0 ? selectedWeights : preferredWeights;

                return {
                    label: name,
                    value: `${name.replace(/\s+/g, "+")}:${weightsToUse.join(",")}`,
                };
            });

            function extractWeights(variantObject) {
                return Object.keys(variantObject).sort();
            }

            const defaultFontFamily = {
                label: "Cormorant Garamond",
                value: "Cormorant+Garamond:300,400,700"
            }

            const defaultHighlightColor = '#17a095';
            const defaultFontSize = 11
            const defaultMargin = 0.75;
            const defaultStyle = {
                fontFamily: defaultFontFamily,
                highlightColor: defaultHighlightColor,
                fontSize: defaultFontSize,
                marginTop: defaultMargin,
                marginBottom: defaultMargin,
                marginLeft: defaultMargin,
                marginRight: defaultMargin,
                pictureScale: 1,
                pictureTranslateX: 0,
                pictureTranslateY: 0,
                hiddenSections: []
            }

            const customCSS = useLocalStorage('json-resume-custom-css', '');

            const style = reactive(Object.fromEntries(
                Object.entries(defaultStyle).map(([key, defaultValue]) => {
                    const keyIdentifier = `${key.replace(/([A-Z])/g, '-$1')}`.toLowerCase()
                    const styleRef = useLocalStorage(`resume-builder-${keyIdentifier}`, defaultValue);

                    watch(styleRef, (value) => {
                        const cssVariable = `--c-resume-builder-${keyIdentifier}`;
                        document.documentElement.style.setProperty(cssVariable, value?.label?? value ?? '');
                    }, {immediate: true});

                    return [key, styleRef];
                })
            ));


            watch(style.fontFamily, (font) => {
                if(!font) return
                console.log('Selected font', font)
                WebFont.load({
                    google: {
                        families: [font.value],
                    },
                    active() {
                        console.log('works!!')
                    },
                    inactive() {
                        console.warn(`Failed to load font: ${font.label}`);
                        nextTick(() => {
                            style.fontFamily = defaultFontFamily
                        })
                    },
                });
            }, {immediate: true, deep: true});


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
                customCSS,
                availableFonts,
                importStyle,
                resetHighlightColor,
                resetMargins
            };
        }
    )
;