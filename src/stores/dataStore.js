import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';

export const useDataStore = defineStore('dataStore', () => {

    const data = {...yaml.load(content)}

    return {
        data
    }
})