import {defineStore} from 'pinia';
import {useLocalStorage} from "@vueuse/core";
import {watch} from "vue";
import {addNewPropertiesFromDefault, bindStateToCssVariables} from "@/util/storeUtils";


export const useStyleStore = defineStore('styleStore', () => {

        const defaultHighlightColor = '#17a095';
        // TODO Fix fontSize implementation as it affects the rest of the page and not only the CV
        const defaultFontSize = '12'
        const defaultMargin = 0.75;
        const defaultStyle = {
            highlightColor: defaultHighlightColor,
            fontSize: defaultFontSize,
            marginTop: defaultMargin,
            marginBottom: defaultMargin,
            marginLeft: defaultMargin,
            marginRight: defaultMargin
        }

        const customCSS = useLocalStorage('json-resume-custom-css', '');
        const style = useLocalStorage('json-resume-style', defaultStyle);

        addNewPropertiesFromDefault(defaultStyle, style)
        bindStateToCssVariables(style)

        // TODO fix import as it keeps leftovers from previous runs
        function importStyle(newStyle) {
            if (!newStyle) {
                style.value = defaultStyle;
            } else {
                style.value = newStyle;
            }
        }

        function resetHighlightColor() {
            style.value.highlightColor = defaultHighlightColor
        }

        function resetMargins() {
            style.value.marginTop = defaultMargin;
            style.value.marginBottom = defaultMargin;
            style.value.marginLeft = defaultMargin;
            style.value.marginRight = defaultMargin;
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


        // const defaultPrimaryColor = '#0b5404';
        // const defaultSecondaryColor = '#d46f00';
        // const defaultHighlightColor = '#bd34fe';
        // const textColor = '#ffffff';

        // const colorPalette = {
        //     series: {default: defaultSecondaryColor, category: 'Title'},
        //     tournament: {default: defaultPrimaryColor, category: 'Title'},
        //     level: {default: defaultSecondaryColor, category: 'Clock'},
        //     clockNumber: {default: textColor, category: 'Clock'},
        //     clockSeparator: {default: textColor, category: 'Clock'},
        //     blindsTitle: {default: defaultSecondaryColor, category: 'Clock'},
        //     blindsValue: {default: textColor, category: 'Clock'},
        //     infoTitle: {default: defaultSecondaryColor, category: 'Info'},
        //     infoValue: {default: textColor, category: 'Info'},
        //     nextLevel: {default: textColor, category: 'Clock'},
        //     pausedBox: {default: defaultPrimaryColor, category: 'Details'},
        //     decorationLines: {default: defaultPrimaryColor, category: 'Details'},
        //     controls: {default: defaultHighlightColor, category: 'Details'},
        //     hover: {default: defaultPrimaryColor, category: 'Details'},
        // };
        //
        // // Create color references and watchers dynamically
        // const paletteColors = Object.fromEntries(
        //     Object.entries(colorPalette).map(([key, {default: defaultValue}]) => {
        //         const colorRef = useLocalStorage(`vue-poker-timer-${camelcaseToHyphenSeparated(key)}-color`, defaultValue);
        //
        //         watch(colorRef, (value) => {
        //             updateVariable(`--c-${camelcaseToHyphenSeparated(key)}-color`, value);
        //         }, {immediate: true});
        //
        //         return [key, colorRef];
        //     })
        // );
        //
        // function getCategory(colorName) {
        //     return colorPalette[colorName].category;
        // }
        //
        // function isSoundFile(filename) {
        //     return noSoundFileName !== filename;
        // }
        //
        // function setNewLevelSound(file) {
        //     const reader = new FileReader();
        //     reader.onload = function (event) {
        //         newLevelSoundBase64.value = event.target.result;
        //         newLevelFileName.value = file.name;
        //     };
        //     reader.readAsDataURL(file);
        // }
        //
        // function setNewBreakSound(file) {
        //     const reader = new FileReader();
        //     reader.onload = function (event) {
        //         newLevelSoundBase64.value = event.target.result;
        //         newLevelFileName.value = file.name;
        //     };
        //     reader.readAsDataURL(file);
        // }
        //
        // function setOneMinuteSound(file) {
        //     const reader = new FileReader();
        //     reader.onload = function (event) {
        //         oneMinuteSoundBase64.value = event.target.result;
        //         oneMinuteFileName.value = file.name;
        //     };
        //     reader.readAsDataURL(file);
        // }
        //
        // function clearNewLevelSound() {
        //     newLevelSoundBase64.value = null;
        //     newLevelFileName.value = noSoundFileName;
        // }
        //
        // function clearNewBreakSound() {
        //     newBreakSoundBase64.value = null;
        //     newBreakFileName.value = noSoundFileName;
        // }
        //
        // function clearOneMinuteSound() {
        //     oneMinuteSoundBase64.value = null;
        //     oneMinuteFileName.value = noSoundFileName;
        // }
        //
        // function updateVariable(variable, color) {
        //     if (!color.startsWith(`#`)) {
        //         color = '#' + color;
        //     }
        //     document.documentElement.style.setProperty(variable, color);
        // }
        //
        // function resetStore() {
        //     for (const [key, colorRef] of Object.entries(paletteColors)) {
        //         colorRef.value = colorPalette[key].default;
        //     }
        //     newLevelSoundBase64.value = null;
        //     newLevelFileName.value = defaultNewLevelFileName;
        //     newBreakSoundBase64.value = null;
        //     newBreakFileName.value = defaultNewBreakFileName;
        //     oneMinuteSoundBase64.value = null;
        //     oneMinuteFileName.value = defaultOneMinuteFileName;
        //     backgroundSetting.value = defaultBackgroundSetting();
        // }

        return {
            style,
            customCSS,
            importStyle,
            resetHighlightColor,
            resetMargins
        };
    }
);