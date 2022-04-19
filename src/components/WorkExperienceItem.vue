<template lang="pug">
.item
  .company.place(v-if='company')
    p {{company}}
  .data
    .title
      span.role.name {{role}}
      span.separator &#124;
      span.location {{location}}
      span.time {{time}}
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
  time: {
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
.separator
</style>