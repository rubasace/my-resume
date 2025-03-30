<template>
  <div class="item interest">
    <i class="icon" :class="icon"></i>
    <span class="title" v-if="name">{{ name }}</span>
    <span class="value">{{ items }}</span>
  </div>
</template>
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
  keywords: {
    type: Object,
    required: false
  }
})
</script>
<script>
export default {
  computed: {
    items() {
      return Array.isArray(this.keywords) ? this.keywords.join(", ") + "." : this.keywords;
    }
  }
}
</script>