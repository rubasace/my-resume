import {createApp} from 'vue'
import App from "./App.vue";
import './assets/base.sass'


import {library} from "@fortawesome/fontawesome-svg-core";
import {faBrain, faBriefcase, faEnvelope, faGraduationCap, faLanguage, faPlaneDeparture, faTrophy, faPhone, faUser, faAward, faSquarePlus} from "@fortawesome/free-solid-svg-icons";
import {faGithubSquare, faJs, faLinkedin, faVuejs} from "@fortawesome/free-brands-svg-icons";

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

const messages = {
    en: {
        section: {
            about: 'about',
            experience: 'professional experience',
            conference: 'conference presentations',
            education: 'education',
            certificates: 'certificates',
            skills: 'skills',
            languages: 'languages',
            awards: 'achievements and awards',
            extras: 'extras',
        }
    },
    es: {
        section: {
            about: 'descripción',
            experience: 'experiencia profesional',
            conference: 'presentaciones en conferencias',
            education: 'estudios',
            certificates: 'certificados',
            skills: 'habilidades',
            languages: 'idiomas',
            awards: 'logros y reconocimientos',
            extras: 'extras',
        }
    }
}

const i18n = createI18n({
    locale: 'en', // set locale
    fallbackLocale: 'en', // set fallback locale
    messages

})


createApp(App)
    .use(i18n)
    .component("font-awesome-icon", FontAwesomeIcon)
    .mount("#app");
