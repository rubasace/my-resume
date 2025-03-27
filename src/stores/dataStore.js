import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {useLocalStorage} from "@vueuse/core";

export const useDataStore = defineStore('dataStore', () => {

    // TODO change file to provide default anonymized values
    const data = useLocalStorage('json-resume-data', yaml.load(content));

    sanitizeData()
    function sanitizeData(){
        initializeIfMissing('work')
        initializeIfMissing('projects')
        initializeIfMissing('publications')
        initializeIfMissing('education')
        initializeIfMissing('certificates')
        initializeIfMissing('skills')
        initializeIfMissing('languages')
        initializeIfMissing('awards')
        initializeIfMissing('extras')
        initializeIfMissing('interests')
        initializeIfMissing('basics', {})
        data.value.basics.location = data.value.basics.location ?? {}
    }

    function initializeIfMissing(field, defaultValue =[]) {
        data.value[field] = data.value[field] ?? defaultValue
    }

    function importData(newData) {
        data.value = newData
        sanitizeData()
    }

    return {
        data,
        importData
    };
})