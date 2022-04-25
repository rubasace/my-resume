<template lang="pug">
.item
  .header
    span.company.place(v-if='company')
      span {{company}}
      span.separator &#x2f;
    span.details
      span.role.name {{role}}
      span.separator &#124;
      span.location {{location}}
      span.separator &#124;
      span.time {{startDate}} - {{endDate}}
  .description(v-if='items')
    ul.item-list
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
  items: {
    type: Array,
    required: false
  }
})
</script>

<style scoped lang="sass">
</style>