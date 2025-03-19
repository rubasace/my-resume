<script setup>

import {ref} from "vue";
import {FileUpload, Button} from "primevue";

const fileInput = ref(null);

const emit = defineEmits(["select"]);

defineProps({
  label: {
    type: String,
    default: "Import"
  }
});

function openFilePicker() {
  fileInput.value.choose()
}
</script>

<template>
  <FileUpload
      ref="fileInput"
      mode="basic"
      @select="emit('select', $event)"
      customUpload
      auto
      accept=".json,.yaml,.yml,application/json,application/x-yaml,text/yaml"
      style="display: none;position:absolute"
  />
  <Button :label="label" icon="pi pi-upload" severity="primary" @click="openFilePicker" class="action" raised/>
</template>