<script setup>

import {computed} from "vue";

const props = defineProps({
  icon: {
    type: Object,
    required: false
  },
  name: {
    type: String,
    required: false
  },
  keywords: {
    type: Object,
    required: false
  }
})

const items = computed(() => {
  return Array.isArray(props.keywords) ? props.keywords.join(", ") + "." : props.keywords;
})
</script>

<template>
  <div class="item interest">
    <i class="icon" :class="icon"></i>
    <span class="title" v-if="name">{{ name }}</span>
    <span class="value">{{ items }}</span>
  </div>
</template>