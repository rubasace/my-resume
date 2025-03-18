import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {reactive} from "vue";

export const useDataStore = defineStore('dataStore', () => {

    const data = reactive(yaml.load(content));

    return { data };
})