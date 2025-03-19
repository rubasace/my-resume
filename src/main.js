import {createApp} from "vue";
import PrimeVue from 'primevue/config';
import ToastService from 'primevue/toastservice';
import {createPinia} from "pinia";
import App from "./App.vue";
import "./assets/themes/rub.sass";
import WebFont from "webfontloader";

import '@fortawesome/fontawesome-free/css/all.min.css';

import Lara from '@primeuix/themes/lara';
import 'primeflex/primeflex.min.css'

WebFont.load({google: {families: ["Cormorant+Garamond:300,400,700"]}});


import {createI18n} from "vue-i18n";

// TODO move to translations file
const messages = {
    en: {
        section: {
            about: "about",
            experience: "professional experience",
            conference: "conference presentations",
            education: "education",
            certificates: "certificates",
            skills: "skills",
            languages: "languages",
            awards: "achievements and awards",
            extras: "extras",
        },
        editor:{
            data: "Data",
            style: "Style",
            importExport: "Import / Export"
        }
    },
    es: {
        section: {
            about: "descripción",
            experience: "experiencia profesional",
            conference: "presentaciones en conferencias",
            education: "estudios",
            certificates: "certificados",
            skills: "habilidades",
            languages: "idiomas",
            awards: "logros y reconocimientos",
            extras: "extras",
        },
        editor:{
            data: "Datos",
            style: "Estilo",
            importExport: "Importar / Exportar"
        }
    },
};

const i18n = createI18n({
    locale: "en",
    fallbackLocale: "en",
    messages,
});

const pinia = createPinia()
const app = createApp(App)
app.use(ToastService);
app.use(PrimeVue, {
    theme: {
        preset: Lara
    }
})
app.use(pinia)
app.use(i18n);
app.mount("#app");
