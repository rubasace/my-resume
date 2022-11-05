<template lang="pug">
.item
  font-awesome-icon.icon(:icon="icon", v-if="icon")
  span.title(v-if="title") {{title}}
  span.value {{items}}

</template>
<script setup>

defineProps({
  icon: {
    type: Object,
    required: false
  },
  title: {
    type: String,
    required: false
  },
  value: {
    type: Object,
    required: true
  }
})
</script>
<script>
export default {
  computed: {
    items() {
      return Array.isArray(this.value) ? this.value.join(", ")+"." : this.value;
    }
  }
}
</script>

<style scoped lang="sass">
.item
  .title
    font-weight: bold
    &::after
      content: ": "
  .icon
    margin-right: 0.25em
    height: 1em
</style>