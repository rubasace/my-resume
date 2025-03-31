<script setup>

import {Textarea, Select} from "primevue";
import {useStyleStore} from "@/stores/styleStore";
import ColorPicker from '@/components/editor/ColorPicker.vue'
import NumberInput from "@/components/editor/NumberInput.vue";
import {VueDraggable} from "vue-draggable-plus";
import SortableSection from "@/components/editor/SortableSection.vue";
import Section from "@/components/editor/Section.vue";
import {useThemeStore} from "@/stores/themeStore";
import Resume from "@/components/resume/Resume.vue";

const styleStore = useStyleStore();
const themeStore = useThemeStore();


</script>


<template>
  <Section name="theme" :hideable="false">
    <div class="theme-selector grid-3">
      <div class="theme" v-for="theme in themeStore.availableThemes" :key="theme" @click="themeStore.selectedTheme=theme">
        <div class="title">{{ theme }}</div>
        <div class="preview">
          <Resume :class="'theme-'+theme"/>
        </div>
      </div>
    </div>
    <Select
        id="resume-theme"
        v-model="themeStore.selectedTheme"
        :options="themeStore.availableThemes"
        class="w-full"
        placeholder="Select Theme"
    />
  </Section>
  <div class="section-title">Fonts</div>
  <NumberInput v-model="styleStore.style.fontSize" label="Font Size" suffix=" pt" :step="0.1" :maxFractionDigits="2"/>

  <!--  <Select v-model="styleStore.style.fontFamily"-->
  <!--          :options="styleStore.availableFonts"-->
  <!--          optionLabel="label"-->
  <!--          placeholder="Choose a font"-->
  <!--          class="mt-3"/>-->

  <div class="section-title">Margins</div>
  <div class="grid-2">
    <NumberInput v-model="styleStore.style.marginTop" label="Margin Top" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginBottom" label="Margin Bottom" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginLeft" label="Margin Left" suffix=" in" :step="0.01"/>
    <NumberInput v-model="styleStore.style.marginRight" label="Margin Right" suffix=" in" :step="0.01"/>
  </div>

  <div class="section-title">Misc</div>
  <div class="grid-2">
    <label class="flex items-center gap-2">
      <input type="checkbox" v-model="styleStore.style.showIcons"/>
      Show Icons
    </label>
    <label class="flex items-center gap-2">
      <input type="checkbox" v-model="styleStore.style.showTimeline"/>
      Show Timeline
    </label>
  </div>

  <div class="section-title">Colors</div>
  <ColorPicker v-model="styleStore.style.highlightColor" label="Highlight Color" @reset="styleStore.resetHighlightColor"/>

  <div class="section-title">Sections Order</div>
  <VueDraggable v-model="styleStore.style.sortedSections">
    <SortableSection :key="section" v-for="section in styleStore.style.sortedSections" :name="section"/>
  </VueDraggable>

  <div class="section-title">Custom CSS</div>
  <Textarea auto-resize id="custom-css" v-model="styleStore.customCSS" placeholder="Custom CSS rules..." style="width:100%" class="mb-2 mt-2"/>
</template>

<style scoped lang="sass">
.section-title
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em

.theme-selector
  .theme
    max-width: 20%
    .preview
      .resume
        transform: scale(0.3)
</style>