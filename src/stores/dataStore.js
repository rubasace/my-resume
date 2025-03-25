import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {useLocalStorage} from "@vueuse/core";

export const useDataStore = defineStore('dataStore', () => {

    // TODO change file to provide default anonymized values
    const data = useLocalStorage('json-resume-data', yaml.load(content));

    sanitizeData()
    function sanitizeData(){
        data.value.work = data.value.work ?? []
        data.value.projects = data.value.projects ?? []
        data.value.publications = data.value.publications ?? []
        data.value.education = data.value.education ?? []
        data.value.certificates = data.value.certificates ?? []
        data.value.skills = data.value.skills ?? []
        data.value.languages = data.value.languages ?? []
        data.value.awards = data.value.awards ?? []
        data.value.extras = data.value.extras ?? []
        data.value.interests = data.value.interests ?? []
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