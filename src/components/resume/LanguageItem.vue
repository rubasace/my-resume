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
<template>
  <div class="item languages">
    <i class="icon" :class="icon"></i>
    <div class="title">{{ name }}</div>
    <div class="title" v-if="name&&level">: </div>
    <div class="value">{{ level }}</div>
  </div>
</template>