<script setup>

import {getProfileIcon} from "@/util/profileUtils";
import Title from "@/components/resume/Title.vue";

const props = defineProps({
  icon: {
    type: String,
    required: false
  },
  url: {
    type: String,
    required: false
  },
  text: {
    type: String,
    required: false
  },
  network: {
    type: String,
    required: false
  }
})


</script>

<template>
  <div class="profile">
    <i class="icon" :class="icon??getProfileIcon(network)??`fab fa${network?.replace(/([A-Z])/g, '-$1').toLowerCase()}`"></i>
    <Title :text="text" :title="network" :url="url"/>
  </div>
</template>