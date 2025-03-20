<template lang="pug">
.item
  .header
    span.place.school {{school}}
    span.separator &#x2f;
    span.name.details {{name}}
    span.time.details
      span {{ String(startDate) }}
      span(v-if="endDate")  - {{ String(endDate) }}
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
    type: [String, Number],
    required: true
  },
  endDate: {
    type: [String, Number],
    required: true
  },
  description: {
    type: String,
    required: false
  }
})
</script>