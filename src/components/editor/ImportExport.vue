<script setup>

import FilePicker from "@/components/editor/FilePicker.vue";
import {useDataStore} from "@/stores/dataStore";
import {Button, useToast} from "primevue";
import yaml from "js-yaml";

const dataStore = useDataStore();
const toast = useToast();

function importData(event) {
  const file = event.files[0];
  if (file) {
    const reader = new FileReader();

    reader.onload = (e) => {
      try {
        const fileContent = e.target.result;
        const fileName = file.name;
        if (fileName.endsWith('.json')) {
          const data = JSON.parse(fileContent);
          dataStore.importData(data)
        } else if (fileName.endsWith('.yaml') || fileName.endsWith('.yml')) {
          const data = yaml.load(fileContent);
          dataStore.importData(data)
        }
        toast.add({severity: 'success', summary: 'Data file imported successfully', detail: `Loaded content from ${file.name}`, life: 5000});
      } catch (error) {
        toast.add({severity: 'error', summary: 'Error loading file', detail: `Data file ${file.name} was not loaded successfully. Error received: ${error.message}`, life: 5000});
      }
    }

    reader.onerror = (error) => {
      toast.add({severity: 'error', summary: 'Error loading file', detail: `Data file ${file.name} was not loaded successfully. Error received: ${error.message}`, life: 5000});
    };

    reader.readAsText(file);
  }
}

function exportFile(format) {
  const data = format === 'yaml' ? yaml.dump(dataStore.data) : JSON.stringify(dataStore.data, null, 2)
  const blob = new Blob([data], {type: 'application/'+format})
  const url = URL.createObjectURL(blob)

  const a = document.createElement('a')
  a.href = url
  a.download = `${dataStore.data.basics.name}-${dataStore.data.basics.label}-resume.${format}`.replace(/ /g, '_')
  a.click()

  URL.revokeObjectURL(url)

  toast.add({ severity: 'success', summary: 'Configuration exported successfully', detail: `Downloaded file ${a.download}`, life: 5000 });
}
</script>

<template>
  <div class="grid-3">
    <FilePicker @select="importData"/>
    <Button label="Export to JSON" icon="pi pi-download" severity="info" @click="exportFile('json')" class="action" raised/>
    <Button label="Export to YAML" icon="pi pi-download" severity="info" @click="exportFile('yaml')" class="action" raised/>
  </div>
</template>

<style scoped lang="sass">

</style>