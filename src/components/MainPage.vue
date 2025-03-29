<script setup>
import Resume from "./resume/Resume.vue";
import Editor from "@/components/editor/Editor.vue";
import Visor from "@/components/Visor.vue";
import { computed, ref } from "vue";
import { useWindowSize } from "@vueuse/core";
import Dialog from 'primevue/dialog';

const { width } = useWindowSize();

const isMobile = computed(() => width.value < 768);

const showEditor = ref(!isMobile.value);

function toggleEditor() {
  showEditor.value = !showEditor.value;
}
</script>

<!--TODO allow to configure language-->
<template>
  <div class="edit-toggle" v-if="isMobile && !showEditor">
    <button @click="toggleEditor" aria-label="Edit">
      <i class="fas fa-pencil"></i>
    </button>
  </div>

  <div class="main-page" :class="{ mobile: isMobile }">
    <div class="view">
      <Visor>
        <Resume />
      </Visor>
    </div>

    <!-- Desktop Editor -->
    <div class="editor" v-if="!isMobile && showEditor">
      <Editor />
    </div>

    <!-- Mobile Dialog Editor -->
    <Dialog
        v-if="isMobile"
        v-model:visible="showEditor"
        modal
        dismissableMask
        :style="{ width: '95vw', height: '95vh' }"
        contentClass="editor-dialog"
    >
      <Editor />
    </Dialog>
  </div>
</template>
<style scoped lang="sass">
.main-page
  display: flex
  position: relative
  //height: 100vh
  height: calc(100vh - var(--vh-offset, 0px))
  width: 100vw
  overflow: hidden

  .view, .editor
    flex: 1
    position: relative
    height: 100%
    box-sizing: border-box
    border: 1px solid black

  .editor
    overflow: scroll

  .view
    overflow: hidden

.edit-toggle
  position: absolute
  top: 1.5em
  right: 1.5em
  z-index: 300

  button
    display: flex
    align-items: center
    justify-content: center
    $button-size: 2.5em
    width: $button-size
    height: $button-size
    border-radius: 50%
    background-color: var(--p-primary-color)
    color: white
    border: none
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2)
    cursor: pointer
    font-size: 1.25em
    transition: background-color 0.2s, transform 0.1s

@media (max-width: 768px)
  .main-page
    flex-direction: column

    .editor
      position: absolute
      top: 0
      left: 0
      height: 100%
      width: 100%
      z-index: 100

    //.view, .editor
    //  max-height: 80vh
    //  min-height: 20em


</style>
