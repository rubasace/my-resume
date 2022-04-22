<template lang="pug">
.item
  span.title(v-if="title") {{title}}
  span.value {{value}}

</template>
<script setup>

defineProps({
  title: {
    type: String,
    required: false
  },
  value: {
    type: String,
    required: true
  }
})
</script>

<style scoped lang="sass">
.title
  font-weight: bold
  &::after
    content: ": "
</style>