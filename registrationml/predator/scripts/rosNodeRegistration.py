#!/usr/bin/env python3
import sys
import rclpy
from rclpy.node import Node
from fsregistration.srv import *

class RegistrationService(Node):

    def __init__(self,config):

        super().__init__('registration_service')

        self.srvLight = self.create_service(LightDensity, 'light_service', self.handleRegistration)

    # executes callback every timer_period seconds (change to appropriate value)
        timer_period = 1
        self.timer = self.create_timer(timer_period, self.leak_callback)
        self.count = 0

def handleRegistration(self, request, response):
    # start correct lightning
    print("starting handle light")
    self.gpioPinLight.hardware_PWM(self.LEDPin, 50, request.intensity * 10000)  # 10000
    print("done")
    response.worked = True
    return response


def main(args=None):
    rclpy.init(args=args)

    leak_publisher = LeakPublisher()

    # Init GPIO pins -> not affected by ROS2 migration
    try:
        GPIO.setmode(GPIO.BCM)  # Set's GPIO pins to BCM GPIO numbering
        # INPUT_PIN = 7  # Sets our input pin, in this example I'm connecting our button to pin 4. Pin 0 is the SDA pin, so I avoid using it for sensors/buttons
        GPIO.setup(INPUT_PIN, GPIO.IN)
    except:
        print("Was not able to initialize GPIO Input")
        exit(-1)
    # print("test3")
    rclpy.spin(leak_publisher)
    # leak_publisher.destroy_node()
    rclpy.shutdown()


if __name__ == '__main__':
    main()

