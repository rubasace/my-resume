<script setup>
import Title from "@/components/resume/Title.vue";

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
  url: {
    type: String,
    required: false
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

<template>
  <div class="item">
    <div class="header">
      <Title :text="company" :url="url" />
      <span class="separator details">/</span>
      <span class="role name details">{{ role }}</span>
      <span class="separator details" v-if="location">|</span>
      <span class="location details">{{ location }}</span>
      <span class="time details">
        <span>{{ startDate }}</span>
        <span v-if="endDate"> - {{ endDate }}</span>
      </span>
    </div>
    <div class="description">
      <p class="summary" v-if="summary">{{ summary }}</p>
      <ul class="item-list" v-if="items">
        <li class="item" v-for="item in items" :key="item">{{ item }}</li>
      </ul>
    </div>
  </div>
</template>
