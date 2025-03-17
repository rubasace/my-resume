<script setup>
import Resume from "./resume/Resume.vue";
import Editor from "@/components/Editor.vue";
import Visor from "@/components/Visor.vue";


</script>

<!--TODO allow to configure language-->
<template>
  <div class="main-page">
    <div class="view">
      <Visor>
        <Resume />
      </Visor>
    </div>
    <div class="editor">
      <Editor/>
    </div>
  </div>

</template>
<style scoped lang="sass">
.main-page
  display: flex
  height: 100%
  width: 100%

  .view, .editor
    flex: 1
    overflow: hidden
    box-sizing: border-box
    border: 1px solid black
</style>
