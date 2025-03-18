<script setup>
import { onMounted, ref } from "vue";
import html2canvas from "html2canvas";
import jsPDF from "jspdf";

const visorRef = ref(null);
const contentRef = ref(null);
const originalContentRef = ref(null);
const scale = ref(1);

const calculateScale = () => {
  if (visorRef.value && contentRef.value) {
    const visorRect = visorRef.value.getBoundingClientRect();
    const contentRect = originalContentRef.value.getBoundingClientRect();
    const visorContentProportion = 0.85;

    const scaleX =
        (visorRect.width / contentRect.width) * visorContentProportion;
    const scaleY =
        (visorRect.height / contentRect.height) * visorContentProportion;

    scale.value = Math.min(scaleX, scaleY, 1);
  }
};

const zoomIn = () => {
  scale.value = Math.min(scale.value + 0.1, 4);
};

const zoomOut = () => {
  scale.value = Math.max(scale.value - 0.1, 0.25);
};

const resetZoom = () => {
  calculateScale();
};

const downloadPDF = async () => {
  //TODO improve -> download as pdf with text instead of image
  if (!originalContentRef.value) return;

  // Select only the `.page` inside the `originalContentRef`
  const pageElement = originalContentRef.value.querySelector(".page");
  if (!pageElement) return;

  const canvas = await html2canvas(pageElement, { scale: 2 });
  const imgData = canvas.toDataURL("image/png");
  const pdf = new jsPDF({
    orientation: "portrait",
    unit: "mm",
    format: "a4",
  });

  const imgWidth = 210;
  const imgHeight = (canvas.height * imgWidth) / canvas.width;

  pdf.addImage(imgData, "PNG", 0, 0, imgWidth, imgHeight);
  pdf.save("resume.pdf");
};

onMounted(() => {
  calculateScale();
});
</script>

<!--TODO allow to move around the page-->
<template>
  <div ref="visorRef" class="visor">
    <div class="content-wrapper">
      <div
          ref="contentRef"
          class="content"
          :style="{ transform: `scale(${scale})`, transformOrigin: 'center' }"
      >
        <slot />
      </div>
      <div ref="originalContentRef" class="originalContent">
        <slot />
      </div>
    </div>
    <div class="menu">
<!--      TODO translate titles -->
      <button @click="zoomIn" title="Zoom in"><i class="fas fa-magnifying-glass-plus"/></button>
      <button @click="zoomOut" title="Zoom out"><i class="fas fa-magnifying-glass-minus"/></button>
      <button @click="resetZoom" title="Fit to screen"><i class="fas fa-expand"/></button>
      <button @click="downloadPDF" title="Download PDF"><i class="fas fa-file-pdf"/></button>
    </div>
  </div>
</template>

<style scoped lang="sass">
.visor
  display: flex
  flex-direction: column
  justify-content: center
  align-items: center
  height: 100vh
  background: #444
  overflow: hidden
  position: relative

  .content-wrapper
    display: flex
    justify-content: center
    align-items: center
    flex-grow: 1
    overflow: hidden

    .content
      display: flex
      justify-content: center
      align-items: center
      transition: transform 0.3s ease
      box-shadow: 10px 10px 10px rgba(#333, 1)

    .originalContent
      position: absolute
      opacity: 0

  .menu
    position: absolute
    bottom: 5%
    left: 50%
    transform: translateX(-50%)
    display: flex
    gap: 1rem
    padding: 0.3rem 1rem
    background: rgba(0, 0, 0, 0.7)
    border-radius: 50px
    backdrop-filter: blur(5px)
    box-shadow: 6px 6px 10px rgba(#333, 1)
    color: white
    width: max-content
    opacity: 0.4

    &:hover
      opacity: 1

    button
      background: transparent
      border: none
      color: white
      font-size: 1.3rem
      cursor: pointer
      padding: 0.5rem 1rem
      border-radius: 5px
      transition: background 0.3s ease

      &:hover
        background: rgba(255, 255, 255, 0.2)
</style>