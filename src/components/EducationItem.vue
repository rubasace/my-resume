<template lang="pug">
.item
  span.school
    span.place {{school}}
    span.separator &#x2f;
  span.details
    span.name {{name}}
    span.separator &#124;
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