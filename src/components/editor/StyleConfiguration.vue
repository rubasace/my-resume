<script setup>

import {Textarea, Select} from "primevue";
import {useStyleStore} from "@/stores/styleStore";
import ColorPicker from '@/components/editor/ColorPicker.vue'
import NumberInput from "@/components/editor/NumberInput.vue";

let styleStore = useStyleStore();


</script>

<template>

  <div class="section-title">Fonts</div>
  <NumberInput v-model="styleStore.style.fontSize" label="Font Size" suffix=" pt" :step="0.1" :maxFractionDigits="2"/>

  <!--  TODO improve performance by applying virtual scroll/pagination-->
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

  <div class="section-title">Colors</div>
  <ColorPicker v-model="styleStore.style.highlightColor" label="Highlight Color" @reset="styleStore.resetHighlightColor"/>

  <div class="section-title">Custom CSS</div>
  <Textarea auto-resize id="custom-css" v-model="styleStore.customCSS" placeholder="Custom CSS rules..." style="width:100%" class="mb-2 mt-2"/>
</template>

<style scoped lang="sass">
.section-title
  width: 100%
  margin: 1em 0
  font-weight: bold
  font-size: 1.6em
</style>