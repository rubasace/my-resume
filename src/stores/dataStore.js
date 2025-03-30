import {defineStore} from 'pinia'
import yaml from "js-yaml";
import content from '../../data.yaml?raw';
import {useLocalStorage} from "@vueuse/core";
import {nextTick, reactive, ref, watch} from "vue";
import {set, get, del} from 'idb-keyval';

const PICTURE_DATA_INDEX_DB_KEY = 'resume-builder-profile-picture';
export const useDataStore = defineStore('dataStore', () => {

    // TODO change file to provide default anonymized values
    const data = useLocalStorage('resume-builder-data', () => yaml.load(content));
    sanitizeData()

    const pictureData = ref(null)
    loadPictureData()

    async function loadPictureData() {
        pictureData.value = await get(PICTURE_DATA_INDEX_DB_KEY);
    }

    function sanitizeData() {
        initializeIfMissing('language', 'en')
        initializeIfMissing('work')
        initializeIfMissing('projects')
        initializeIfMissing('conferences')
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

    function initializeIfMissing(field, defaultValue = []) {
        data.value[field] = data.value[field] ?? defaultValue
    }

    function importData(newData) {
        data.value = newData
        sanitizeData()
    }

    const addProfile = () => {
        data.value.basics.profiles.push({network: '', url: '', placeholder: ''});
    };

    const addExperience = () => {
        data.value.work.push(reactive({
            name: "",
            position: "",
            location: "",
            startDate: "",
            endDate: "",
            summary: "",
            highlights: []
        }));
    };

    const addProject = () => {
        data.value.projects.push(reactive({
            name: "",
            startDate: "",
            endDate: "",
            description: "",
            highlights: []
        }));
    };

    const addConference = () => {
        data.value.conferences.push({
            conference: "",
            name: "",
            location: "",
            time: "",
            summary: ""
        });
    };

    const addPublication = () => {
        data.value.publications.push({
            name: "",
            publisher: "",
            releaseDate: "",
            summary: ""
        });
    };

    const addEducation = () => {
        data.value.education.push({
            institution: "",
            studyType: "",
            startDate: "",
            endDate: "",
            summary: ""
        });
    };

    const addCertificate = () => {
        data.value.certificates.push({
            name: "",
            issuer: "",
            date: ""
        });
    };

    const addAward = () => {
        data.value.awards.push({
            title: "",
            awarder: "",
            date: "",
            summary: ""
        });
    };

    const addSkill = () => {
        data.value.skills.push({
            name: "",
            keywords: [],
        });
    };

    const addLanguage = () => {
        data.value.languages.push({
            language: "",
            fluency: "",
        });
    };

    const addInterest = () => {
        data.value.interests.push({
            name: "",
            keywords: [],
        });
    };


    const addHighlight = (work) => {
        if (!work.highlights) {
            work.highlights = [];
        }
        work.highlights.push("");
    };


    async function clearPicture() {
        data.value.basics.picture = undefined;
    }

    function setPicture(fileName, fileData) {
        data.value.basics.picture = fileName;
        nextTick(() => {
            pictureData.value = fileData
        })
    }

    watch(() => data.value.basics.picture, () => {
            pictureData.value = undefined
        }
    );

    watch(
        () => pictureData.value,
        async (newVal) => {
            if (!newVal) {
                await del(PICTURE_DATA_INDEX_DB_KEY);
            } else if (pictureData.value) {
                await set(PICTURE_DATA_INDEX_DB_KEY, pictureData.value);
            }
        }
    );

    return {
        data,
        pictureData,
        addProfile,
        addExperience,
        addProject,
        addConference,
        addPublication,
        addEducation,
        addCertificate,
        addAward,
        addSkill,
        addLanguage,
        addInterest,
        addHighlight,
        importData,
        setPicture,
        clearPicture
    };
})