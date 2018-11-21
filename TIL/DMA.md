# DMA

## DMA란?
DMA(Direct Memory Access)란 CPU와 독립적으로 메모리에서 메모리로 데이터를 이동시키는 장치이다.
  
CPU는 빠른 클락으로 작동하는 반면, 주변 장치들은 더 낮은 속도로 작동한다. 특히 외부 저장장치등에 연결되면 더욱 낮은 속도로 작동하게 되는데, **이러한 접근 시간에 다른 작업을 할 수 있도록** 메모리와 메모리 사이에서 데이터 전송을 담당하는 장치를 DMA라고 한다.  

CPU와 DMA 모두 버스를 사용하여 데이터를 전송한다. CPU의 데이터 전송이 더 상위 권한에 있다. 이때 CPU를 Bus Master라고 부르고, DMA는 Bus Slave라고 한다. 기본적으로 CPU가 버스를 점유하고 있고, 필요한 때에 DMA가 CPU에 요청(BR-Bus Request)신호를 보내고 이를 허락(BG - Bus Granted)신호가 도착하면 버스를 점유하는 방식으로 작동된다.

## 동작순서
1. BR : DMA가 CPU에게 메모리 버스 제어권을 요구함  
2. BG : CPU가 내부 동작 timing에서 버스 제어권을 DMA에 양보 
3. Transfer : DMA가 버스를 사용
4.  제어권 반납 : CPU에게 반납
5.  1-4 반복
6.  종료 : 인터럽트 발생

## 동작 구조
**보내는 장치 - DMA - 받는 장치** 의 구조로 구성된다.  

### 보내는 장치 (Source 장치)
 * Source 주소
 * 소속버스 (AHB/APB)

### DMA
 * Source 주소
 * 소속버스 (AHB/APB)

### 받는 장치 (Destination 장치)
 * Source 주소
 * 소속버스 (AHB/APB) 
   



### DCON
* TSZ : burst 쓸지 안쓸지(버스를 몇번 빌릴지)  
* DSZ : 한번 버스 빌려서 몇 바이트 쓸지  
* TC  : 전송횟수  

