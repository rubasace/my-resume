import {createApp} from "vue";
import PrimeVue from 'primevue/config';
import {createPinia} from "pinia";
import App from "./App.vue";
import "./assets/themes/rub.sass";
import WebFont from "webfontloader";


import Lara from '@primeuix/themes/lara';
import "/node_modules/primeflex/primeflex.css"

WebFont.load({google: {families: ["Cormorant+Garamond:300,400,700"]}});

import {library} from "@fortawesome/fontawesome-svg-core";
import {
    faBrain,
    faBriefcase,
    faEnvelope,
    faGraduationCap,
    faLanguage,
    faPlaneDeparture,
    faTrophy,
    faPhone,
    faUser,
    faAward,
    faSquarePlus,
} from "@fortawesome/free-solid-svg-icons";
import {
    faGithubSquare,
    faJs,
    faLinkedin,
    faVuejs,
} from "@fortawesome/free-brands-svg-icons";

import {FontAwesomeIcon} from "@fortawesome/vue-fontawesome";
import {createI18n} from "vue-i18n";

library.add(faPhone);
library.add(faEnvelope);
library.add(faUser);
library.add(faSquarePlus);
library.add(faTrophy);
library.add(faAward);
library.add(faGithubSquare);
library.add(faLinkedin);
library.add(faBriefcase);
library.add(faPlaneDeparture);
library.add(faGraduationCap);
library.add(faBrain);
library.add(faLanguage);
library.add(faJs, faVuejs);

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
            style: "Style"
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
            style: "Estilo"
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
app.use(PrimeVue, {
    theme: {
        preset: Lara
    }
})
app.use(pinia)
app.use(i18n);
app.component("font-awesome-icon", FontAwesomeIcon);
app.mount("#app");
