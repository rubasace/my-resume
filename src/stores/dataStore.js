import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {useLocalStorage} from "@vueuse/core";
import {useStyleStore} from "@/stores/styleStore";

export const useDataStore = defineStore('dataStore', () => {

    let styleStore = useStyleStore();
    // TODO change file to provide default anonymized values
    const data = useLocalStorage('json-resume-data', loadInitialData);

    function loadInitialData(){
        const value = yaml.load(content)
        const {_builderData, ...data} = value;

        styleStore.importStyle(_builderData?.style??{})
        styleStore.customCSS = _builderData?.customCss??''
        return data
    }
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