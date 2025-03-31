import {createApp} from "vue";
import PrimeVue from 'primevue/config';
import ToastService from 'primevue/toastservice';
import ConfirmationService from 'primevue/confirmationservice';
import {createPinia} from "pinia";
import App from "./App.vue";
import "./assets/layout.sass";
import.meta.glob('@/assets/themes/*.sass', { eager: true })
import Lara from '@primeuix/themes/aura';
import 'primeflex/primeflex.min.css'
import '@fortawesome/fontawesome-free/css/all.min.css';
import vhCheck from 'vh-check';

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
