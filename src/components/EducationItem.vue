<template lang="pug">
.item
  .school.place
    p {{school}}
  .data
    .title
      span.name {{name}}
      span.time {{time}}
    .description(v-if='description')
      p {{description}}

</template>
<script setup>

defineProps({
  school: {
    type: String,
    required: true
  },
  name: {
    type: String,
    required: true
  },
  time: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: false
  }
})
</script>

<style scoped lang="sass">

</style>