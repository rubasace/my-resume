<script setup>
import {useLocaleStore} from '@/stores/localeStore'
import {Popover} from 'primevue'
import {ref} from "vue";

const localeStore = useLocaleStore()

const languageMenu = ref(null)

// TODO improve this
const flagMap = {
  en: '🇺🇸',
  es: '🇪🇸',
  fr: '🇫🇷',
  de: '🇩🇪',
  it: '🇮🇹',
  pt: '🇵🇹',
  zh: '🇨🇳',
  ja: '🇯🇵',
  nl: '🇳🇱',
  pl: '🇵🇱',
}

function selectLocale(code) {
  localeStore.appLocale = code
}

function isSelected(code) {
  return localeStore.appLocale === code
}

function toggle(event){
  languageMenu.value.toggle(event)
}

function getLabel(code) {
  const labels = {
    en: 'English',
    es: 'Español',
    fr: 'Français',
    de: 'Deutsch',
    it: 'Italiano',
    pt: 'Português',
    // Extend as needed
  }
  return labels[code] || code.toUpperCase()
}

</script>

<template>
  <div class="inline-block preview" @click="toggle">
    {{flagMap[localeStore.appLocale??'en']}}
  </div>

  <Popover ref="languageMenu" id="langPopover" class="w-40">
    <div class="py-2">
      <div
          v-for="code in localeStore.supportedLocales"
          :key="code"
          @click="selectLocale(code)"
          class="flex items-center justify-between px-3 py-2 cursor-pointer hover:bg-surface-100"
      >
        <span>{{ getLabel(code) }}</span>
        <i v-if="isSelected(code)" class="pi pi-check text-primary"/>
      </div>
    </div>
  </Popover>
</template>

<style scoped lang="sass">
.preview
  color: white
  width: 100%
  height: 100%
  font-size: 2em
  background-color: transparent
  &:hover
    cursor: pointer
    background-color: #333
</style>