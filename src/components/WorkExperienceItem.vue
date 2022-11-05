<template lang="pug">
.item
  .header
    span.place.company(v-if='company') {{company}}
    span.separator.details &#x2f;
    span.role.name.details {{role}}
    span.separator.details(v-if='location') &#124;
    span.location.details {{location}}
    span.time.details
        span {{startDate}}
        span(v-if="endDate")  - {{endDate}}
  .description
    p.summary(v-if='summary') {{summary}}
    ul.item-list(v-if='items')
      li(v-for='item in items').item {{item}}

</template>
<script setup>

defineProps({
  company: {
    type: String,
    required: false
  },
  role: {
    type: String,
    required: true
  },
  location: {
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
  summary: {
    type: String,
    required: false
  },
  items: {
    type: Array,
    required: false
  }
})
</script>
