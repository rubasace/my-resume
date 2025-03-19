import {watch} from "vue";

/**
 * Convenience method to bind a state object from a store into CSS variables
 * @param state the state object from the store
 */
export function bindStateToCssVariables(state) {
    Object.keys(state.value).forEach((key) => {
        watch(() => state.value[key], (newValue) => {
            const cssVariable = `--c-resume-${key.replace(/([A-Z])/g, '-$1').toLowerCase()}`;
            console.log("Creating CSS variable", cssVariable, newValue);
            document.documentElement.style.setProperty(cssVariable, newValue??'');
        }, { immediate: true });
    });
}

/**
 * Convenience method to update a state appending all new properties that are still missing. This method is useful so we can append new properties without having to
 * delete the localStorage in order to get them on old clients.
 * @param defaultState an object representing the default state for new stores
 * @param state the current state of the store
 */
export function addNewPropertiesFromDefault(defaultState, state) {
    const reloadedStyle = {
        ...defaultState
    }
    Object.assign(reloadedStyle, state.value)
    state.value = reloadedStyle
}