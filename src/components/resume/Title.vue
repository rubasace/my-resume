<script setup>
import {computed} from "vue";

const props = defineProps({
  title: {
    type: String,
    required: false
  },
  text: {
    type: String,
    required: false
  },
  url: {
    type: String,
    required: false
  }
})

const displayedText = computed(() => {
  if (props.text?.length > 0) {
    return props.text
  } else if (props.title?.length > 0) {
    return props.title
  }
  return props.url
})

const linkTitle = computed(() => {
  if (props.title?.length > 0) {
    return props.title
  } else if (props.text?.length > 0) {
    return props.text
  }
  return ''
})

</script>

<template>
  <a class="title" :href="url" target="_blank" :title="linkTitle" v-if="url">{{ displayedText }}</a>
  <span class="title" v-else>{{ displayedText }}</span>
</template>

<style scoped lang="sass">

</style>