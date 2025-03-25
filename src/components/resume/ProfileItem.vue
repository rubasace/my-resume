<script setup>

import {computed} from "vue";

const props = defineProps({
  icon: {
    type: String,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  value: {
    type: String,
    required: true
  }
})

const items = computed(() => {
  return Array.isArray(props.value) ? props.value.join(", ") + "." : props.value
})

</script>

<template>
  <div class="item profiles">
    <i class="icon" :class="icon"></i>
    <span class="title" v-if="title">{{ title }}</span>
    <span class="value">{{ items }}</span>
  </div>
</template>

<style scoped lang="sass">
.icon
  width: 1em
</style>