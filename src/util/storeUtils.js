import {watch} from "vue";

/**
 * Convenience method to bind a state object from a store into CSS variables
 * @param state the state object from the store
 */
export function bindStateToCssVariables(state) {
    console.log("Watching state of object ",state.value)
    return Object.keys(state.value).map((key) => {
        return watch(() => state.value[key], (newValue) => {
            console.log("watching key " + key + " with current value " + state?.value[key] + " and new value " + newValue)
            const cssVariable = `--c-resume-builder-${key.replace(/([A-Z])/g, '-$1').toLowerCase()}`;
            document.documentElement.style.setProperty(cssVariable, newValue ?? '');
        }, {immediate: true, deep: true});
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