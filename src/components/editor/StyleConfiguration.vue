<script setup>

import {Textarea} from "primevue";
import {useStyleStore} from "@/stores/styleStore";
import ColorPicker from '@/components/editor/ColorPicker.vue'
import NumberInput from "@/components/editor/NumberInput.vue";
import {VueDraggable} from "vue-draggable-plus";
import SortableSection from "@/components/editor/SortableSection.vue";
import {useThemeStore} from "@/stores/themeStore";
import Resume from "@/components/resume/Resume.vue";
import {useLocaleStore} from "@/stores/localeStore";

const styleStore = useStyleStore();
const themeStore = useThemeStore();
const localeStore = useLocaleStore();

</script>


<template>
  <div class="section-title">{{localeStore.getAppMessage("editor.style.theme.section-title")}}</div>
    <div class="theme-selector">
      <div class="theme" :class="theme===themeStore.selectedTheme ? 'selected' : ''" v-for="theme in themeStore.availableThemes" :key="theme" @click="themeStore.selectedTheme=theme">
        <div class="title">{{ theme }}</div>
        <div class="preview">
          <Resume :class="'theme-'+theme"/>
        </div>
      </div>
    </div>
  <div class="section-title">{{localeStore.getAppMessage("editor.style.font.section-title")}}</div>
  <NumberInput v-model="styleStore.style.fontSize" :label="localeStore.getAppMessage('editor.style.font.font-size')" suffix=" pt" :step="0.1" :maxFractionDigits="2"/>


  <div class="section-title">{{localeStore.getAppMessage("editor.style.margin.section-title")}}</div>
  <div class="grid-2">
    <NumberInput v-model="styleStore.style.marginTop" :label="localeStore.getAppMessage('editor.style.margin.margin-top')" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginBottom" :label="localeStore.getAppMessage('editor.style.margin.margin-bottom')" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginLeft" :label="localeStore.getAppMessage('editor.style.margin.margin-left')" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginRight" :label="localeStore.getAppMessage('editor.style.margin.margin-right')" suffix=" in" :step="0.01"/>
  </div>

  <div class="section-title">{{localeStore.getAppMessage("editor.style.misc.section-title")}}</div>
  <div class="grid-2">
    <label class="flex items-center gap-2">
      <input type="checkbox" v-model="styleStore.style.showIcons"/>
      {{localeStore.getAppMessage("editor.style.misc.show-icons")}}
    </label>
    <label class="flex items-center gap-2">
      <input type="checkbox" v-model="styleStore.style.showTimeline"/>
      {{localeStore.getAppMessage("editor.style.misc.show-timeline")}}
    </label>
  </div>

  <div class="section-title">{{localeStore.getAppMessage("editor.style.color.section-title")}}</div>
  <ColorPicker v-model="styleStore.style.highlightColor" :label="localeStore.getAppMessage('editor.style.color.highlight-color')" @reset="styleStore.resetHighlightColor"/>

  <div class="section-title">{{localeStore.getAppMessage("editor.style.section-order.section-title")}}</div>
  <VueDraggable v-model="styleStore.style.sortedSections">
    <SortableSection :key="section" v-for="section in styleStore.style.sortedSections" :name="section"/>
  </VueDraggable>

  <div class="section-title">{{localeStore.getAppMessage("editor.style.custom-css.section-title")}}</div>
  <Textarea auto-resize id="custom-css" v-model="styleStore.customCSS" :placeholder="localeStore.getAppMessage('editor.style.custom-css.placeholder')" style="width:100%" class="mb-2 mt-2"/>
</template>

<style scoped lang="sass">
.section-title
  text-transform: capitalize
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em

.theme-selector
  display: flex
  gap: 1rem
  flex-wrap: nowrap
  overflow-x: auto
  overflow-y: hidden
  width: 100%
  padding: 1rem
  //scroll-snap-type: x proximity
  scrollbar-width: thin
  scrollbar-color: var(--p-primary-color) transparent
  -webkit-overflow-scrolling: touch // better on iOS
  scroll-behavior: smooth

  .theme
    flex: 0 0 auto
    width: 250px
    border: 1px solid #ddd
    border-radius: 8px
    overflow: hidden
    transition: box-shadow 0.2s
    scroll-snap-align: start
    cursor: pointer
    background: var(--surface-card)
    color: var(--text-color)

    &.selected
      box-shadow: 0 0 0 4px var(--p-primary-color)
    &:hover
      box-shadow: 0 0 0 4px #085bc1

    .title
      text-transform: capitalize
      color: white
      text-align: center
      font-weight: bold
      padding: 0.5rem
      background: #020202

    .preview
      position: relative
      width: 100%
      aspect-ratio: 210 / 297 // A4
      background: white
      overflow: hidden

      *
        pointer-events: none
        user-select: none

      .resume
        position: absolute
        top: 0
        left: 0
        transform-origin: top left
        transform: scale(calc(250px / 8.27in))
</style>