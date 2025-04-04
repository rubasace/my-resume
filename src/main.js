import {createApp} from "vue";
import PrimeVue from 'primevue/config';
import ToastService from 'primevue/toastservice';
import ConfirmationService from 'primevue/confirmationservice';
import {createPinia} from "pinia";
import App from "./App.vue";
import "./assets/layout.sass";
import Lara from '@primeuix/themes/aura';
import 'primeflex/primeflex.min.css'
import '@fortawesome/fontawesome-free/css/all.min.css';
import vhCheck from 'vh-check';
import WebFontLoader from 'webfontloader';

WebFontLoader.load({
    google: {
        families: ['Cormorant Garamond:100,300,400,500,700,900']
    }
})
vhCheck();
const pinia = createPinia()
const app = createApp(App)
app.use(ToastService);
app.use(ConfirmationService);
app.use(PrimeVue, {
    theme: {
        preset: Lara
    }
})
app.use(pinia)
app.mount("#app");