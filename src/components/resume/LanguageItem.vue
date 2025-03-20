<script setup>

defineProps({
  icon: {
    type: Object,
    required: false
  },
  name: {
    type: String,
    required: false
  },
  level: {
    type: String,
    required: true
  }
})
</script>
<template lang="pug">
  .item.skills
    i.icon(:class="`${icon}`")
    span.title(v-if="name") {{name}}
    span.value {{level}}

</template>