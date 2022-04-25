import {createApp} from 'vue'
import CV from "./CV.vue";
import './assets/base.sass'


import { library } from "@fortawesome/fontawesome-svg-core";
import { faBriefcase, faPlaneDeparture, faGraduationCap, faBrain, faLanguage, faEnvelope } from "@fortawesome/free-solid-svg-icons";
import { faGithubSquare, faLinkedin } from "@fortawesome/free-brands-svg-icons";
import { faJs, faVuejs } from "@fortawesome/free-brands-svg-icons";

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome";

library.add(faEnvelope);
library.add(faGithubSquare);
library.add(faLinkedin);
library.add(faBriefcase);
library.add(faPlaneDeparture);
library.add(faGraduationCap);
library.add(faBrain);
library.add(faLanguage);
library.add(faJs, faVuejs);


createApp(CV)
    .component("font-awesome-icon", FontAwesomeIcon)
    .mount("#app");
