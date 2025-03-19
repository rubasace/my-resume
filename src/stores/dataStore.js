import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {useLocalStorage} from "@vueuse/core";

export const useDataStore = defineStore('dataStore', () => {

    // TODO change file to provide default anonymized values
    const data = useLocalStorage('json-resume-data', yaml.load(content));

    function importData(newData) {
        data.value = newData
    }

    return {
        data,
        importData
    };
})