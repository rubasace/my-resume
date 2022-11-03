<template lang="pug">
.item
  .header
    span.place.school {{school}}
    span.separator &#x2f;
    span.name.details {{name}}
    span.time.details
      span {{startDate}}
      span(v-if="endDate")  - {{endDate}}
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
  startDate: {
    type: String,
    required: true
  },
  endDate: {
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