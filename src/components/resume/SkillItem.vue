<script setup>

import {computed} from "vue";

const props = defineProps({
  icon: {
    type: Object,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  value: {
    type: Object,
    required: true
  }
})

const items = computed(() => {
  return Array.isArray(props.value) ? props.value.join(", ") + "." : props.value
})

</script>

<template>
  <div class="item skill">
    <i class="icon" :class="icon"></i>
    <span class="title" v-if="title">{{ title }}</span>
    <span class="title" v-if="title && items">: </span>
    <span class="value">{{ items }}</span>
  </div>
</template>
