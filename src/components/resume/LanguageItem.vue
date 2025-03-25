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
  <div class="item skills">
    <i class="icon" :class="icon"></i>
    <span class="title" v-if="name">{{ name }}</span>
    <span class="title" v-if="name&&level">: </span>
    <span class="value">{{ level }}</span>
  </div>
</template>