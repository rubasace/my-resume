<script setup>
import Tabs from 'primevue/tabs';
import TabList from 'primevue/tablist';
import Tab from 'primevue/tab';
import TabPanels from 'primevue/tabpanels';
import TabPanel from 'primevue/tabpanel';
import DataEditor from "./DataEditor.vue";
import ImportExport from "@/components/editor/ImportExport.vue";
import StyleConfiguration from "@/components/editor/StyleConfiguration.vue";
import {useLocaleStore} from "@/stores/localeStore";

const localeStore = useLocaleStore();

</script>

<template>
  <div class="editor">
    <Tabs value="0">
      <TabList>
        <Tab value="0">{{ $t("editor.tabs.data") }}</Tab>
        <Tab value="1">{{ $t("editor.tabs.style") }}</Tab>
        <Tab value="2">{{ $t("editor.tabs.importExport") }}</Tab>
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
            <ImportExport/>
          </div>
        </TabPanel>
      </TabPanels>
    </Tabs>

  </div>
</template>
<style scoped lang="sass">
.p-tab
  text-transform: capitalize
.editor
  height: 100%

  .tab-content
    //background-color: white
    display: block
    height: 100%
</style>
