<template lang="pug">
.item
  .header
    span.conference.place(v-if='conference')
      span {{conference}}
      span.separator &#x2f;
    span.conference.name.details(v-if='name') {{name}}
    span.separator.details(v-if='name') &#124;
    span.location.details(v-if='location') {{location}}
    span.time.details {{time}}
  .description
    p.summary(v-if='summary') {{summary}}
    ul.item-list(v-if='items')
      li(v-for='item in items').item {{item}}

</template>
<script setup>

defineProps({
  name: {
    type: String,
    required: false
  },
  conference: {
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

<style scoped lang="sass">
.name
  text-transform: unset !important
</style>