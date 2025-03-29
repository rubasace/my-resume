<script setup>
import {useDataStore} from "@/stores/dataStore";


import Tabs from 'primevue/tabs';
import TabList from 'primevue/tablist';
import Tab from 'primevue/tab';
import TabPanels from 'primevue/tabpanels';
import TabPanel from 'primevue/tabpanel';
import DataEditor from "./DataEditor.vue";
import ImportExport from "@/components/editor/ImportExport.vue";
import StyleConfiguration from "@/components/editor/StyleConfiguration.vue";


const dataStore = useDataStore()

</script>

<template>
  <div class="editor">
    <Tabs value="0">
      <TabList>
        <Tab value="0">{{ $t("editor.data") }}</Tab>
        <Tab value="1">{{ $t("editor.style") }}</Tab>
        <Tab value="2">Raw Data</Tab>
        <Tab value="3">{{ $t("editor.importExport") }}</Tab>
      </TabList>
      <TabPanels>
        <TabPanel value="0">
          <div class="tab-content">
            <DataEditor/>
          </div>
        </TabPanel>
        <TabPanel value="1">
          <div class="tab-content">
            <StyleConfiguration/>
          </div>
        </TabPanel>
        <TabPanel value="2">
          <div class="tab-content">
            <pre>{{ JSON.stringify(dataStore.data, null, 2) }}</pre>
          </div>
        </TabPanel>
        <TabPanel value="3">
          <div class="tab-content">
            <ImportExport/>
          </div>
        </TabPanel>
      </TabPanels>
    </Tabs>

  </div>
</template>
<style scoped lang="sass">
.editor
  height: 100%

  .tab-content
    //background-color: white
    display: block
    height: 100%
</style>
