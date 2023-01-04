

.286
.MODEL SMALL

.STACK 64

.DATA   

rec_msg      db    ?    
exitChat db '- To end chatting press F3$'
invitePlay db 'waiting for player 2 to be Ready to play$'
inviteChat db 'waiting for player 2 to be Ready to chat$'
lastStage db ?
;; bool to exit the chat
exitChat_bool db 0



last1 db ?
last2 db ?
nowPlayer_Chat db ?
player2 db 'player 2','$' 
exit db '- To end chatting press F3$'
;Data defing for the UI screen Stage 2
chatMSG db  'To start chatting press F1','$'
startMSG db 'To start the game press F2$'
endMSG   db 'To end the program press ESC$'
stage db 0 ;an indication in the UI mode to indicates the user option then switch to it 
;0: back to UI window
;1: chat mode
;2: play mode
;3: exit

;Notifications Data;
rr db 80 dup('-'),'$'
;Data defined the mainscreen ;
    cur      db        ?,?
    msg      db        'Please enter your name:','$'
    notValidName db        'Your name must start with character','$'
    validName db      'Press Enter Key to continue','$'
    wonText db      'Won!!!','$'
    user2    db        'ENEMY', '$'
    iwon db 'YOU$'

             username1 LABEL BYTE
    mx_sz    db        17
    ac_sz    db        ?

    user1    db        15 dup('$')


	msg1 db " hello, world! "
pos dw ?

;; row and col are an indiction to thefirst player movement
row db ?
col db ?
rec dw ?
color db ?
base_color db ?

;Size: 20 x 20 


arrow_right                             db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,0ffh,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,36h,36h,36h,36h,36h,36h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh

;Size: 20 x 20 

black_bishop                            db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,12h,12h,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,12h,12h,12h,12h,12h,12h,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh
                                        db    0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h

;Size: 20 x 20 
black_king                              db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh

;Size: 20 x 20 
black_knight                            db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh

;Size: 20 x 20 
black_pawn                              db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh

;Size: 20 x 20 
black_queen                             db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,12h,12h,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh

;Size: 20 x 20 
black_rock                              db    0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,12h,12h,12h,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh,0ffh,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,12h,0ffh

;Size: 20 x 20 
white_bishop                            db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0fh,0fh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh
                                        db    0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh

;Size: 20 x 20 
white_king                              db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh

;Size: 20 x 20 
white_knight                            db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh

;Size: 20 x 20 
white_pawn                              db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh

;Size: 20 x 20 
white_queen                             db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0fh,0fh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh

;Size: 20 x 20 
white_rock                              db    0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0ffh,0ffh,0ffh
                                        db    0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh,0ffh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0fh,0ffh
;;1 tabya 
;;2 7osan
;;3 feel
;;5 king 
;;4 wazeer
;;6 soldier
;; 0 no object 
;; 7-> tabya // 8->> 7osan// 9->>feel // 11->> king //10->> wazeer //12->> soldier 

chess_board     db 1, 2, 3, 5, 4, 3, 2, 1
                db 6, 6, 6, 6, 6, 6, 6, 6
                db 0, 0, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0, 0, 0, 0, 0, 0 
                db 0, 0, 0, 0, 0, 0, 0, 0 
                db 12, 12, 12, 12, 12, 12, 12, 12
                db 7, 8, 9, 11, 10, 9, 8, 7



chess_board_original    db 1, 2, 3, 5, 4, 3, 2, 1
                        db 6, 6, 6, 6, 6, 6, 6, 6
                        db 0, 0, 0, 0, 0, 0, 0, 0 
                        db 0, 0, 0, 0, 0, 0, 0, 0 
                        db 0, 0, 0, 0, 0, 0, 0, 0 
                        db 0, 0, 0, 0, 0, 0, 0, 0 
                        db 12, 12, 12, 12, 12, 12, 12, 12
                        db 7, 8, 9, 11, 10, 9, 8, 7

;; aboTaha game defined data for highlighting 

highlighting_color1 db 50h ; player 1: the color of the highlighted cell (to be able to move to).
highlighting_color2 db 60h ; player 2: the color of the highlighted cell (to be able to move to).
highlighting_colorBoth db 40h ;; if a cell is valid for both players it will be highlighted with this color
piece_id db ? ; the clicked piece id
like_me_flag db ? ; used in proc is_it_same
DelX db 1, -1, 0, 0, 1, -1, 1, -1
DelY db 0, 0, 1, -1, 1, 1, -1, -1

; for the knight as it is a special case
DelX2 db -2, -2, 2, 2, 1, 1, -1, -1
DelY2 db -1, 1, -1, 1, -2, 2, -2, 2

IsValid db ? ; 1 if the cell I'm trying to reach is valid and 0 otherwise. used(in proc check_validity)




;; game defined data KORE definition 

;; user will first click on one cell 

click_flag db 0;; 0 means user didnt click on a cell and 
;1 is the first click
; nowRow db ?
; nowCol db ?
nowClick db ?
valid_cells1     db 64 dup (0) ; player 1. 1 if the user can move to this cell, 0 otherwise
valid_cells2     db 64 dup (0) ; player 2. 1 if the user can move to this cell, 0 otherwise
;; selected cell right now 

selectedCell_row db ?
selectedCell_col db ?
nowObject db ?
goCell db ?
isLighted_flag db ? ;; this is a flag that solves the bug of inverse_highlight proc that appears when the player tries to move on a highlighteed valid cell
;; refer to inverse_highlight proc for more info
;; 0 not highlighted ,1 is highlighted by player 1 ,2 is lighted by player 2 , 3 is lighted by both players


 ;; an indication to the second player movement
cursorColor1 db 7
cursorColor2 db 4
click_flag1 db ?
selectedCell_row1 db ?
selectedCell_col1 db ?

nowPlayer db ? ;; indicates the player that is taking a move in this exact time of the processing

;; time handling data 
nowSecond db ? 
nowMin    db ?

;; a timer of every cell in our grid 

cellsTimer dw 64 dup (0);;assuming initial state is always zero 
nowIndex db ?
canMove_flag db ?

;; Status defined Data KORE
Status_row db 0;; initialy are zeroes as we start drawing from zeroes 
Status_col db 8 ;; initial state
Status_gridColor db 6
nowKilled db 0
winner_flag db 0
; flags of checks
whiteking_in_check db 0
blackking_in_check db 0
whiteking_in_checkmate db 0
blackking_in_checkmate db 0
king1Pos dw ?
king2Pos dw ?
;; colors of check and checkmate
check_color db 0Eh
checkMate_color db 4 
King1_row db ? 
King1_col db ?
King2_row db ?
King2_col db ?

;;UART Defined DATA
rec_bool db ?;; bool that indicates whether i recieved at this moment or not
tra_bool db ?;; bool that indicates if 
VALUE db ?;; buffer 


;; recieved bytess from second player
row1 db ?
col1 db ?

 ;; an indication to the action i took and we need to transmit it 
TRA_action db ?
REC_action db ? 
;; the recieved action from the user 


;;inGameChat Data

;; used for dividing the screen
rr1 db 8 dup('-'),'$'
str1 db 'YOU:$'
str2 db 'ME:$'


last1_row db ?
last2_row db ?;;x
last1_col    db  ?
last2_col db     ?;;y

shift db ?
player1_start db 1
player2_start db 13
player1_end db 10
player2_end db 22
last1_back db 1
last2_back db 13

nowChat db -1
inChat_flag db ?

game_flag db ?

go_main db ?
.code




get_username proc
                 pusha
                 mov   ah,0Ah
                 mov   dx, offset username1
                 int   21h
                 popa
                 ret
                     
get_username endp




CURSOR_getPosition proc
pusha
;; get cursor curition
mov ah,3h
mov bh,0h
int 10h
;; store the current line in cur+1 and the current colummn in cur
mov cur,dl
mov cur+1,dh
popa
ret
CURSOR_getPosition endp

SET_CURSOR PROC
                 pusha
                 mov   dh,cur+1
                 mov   dl,cur
                 mov   bh,0
                 mov   ah,2
                 int   10h
                 popa
                 ret
SET_CURSOR endp

print_char macro c
                 pusha
             mov ah,2 
             mov dl,c
               int 21h
                 popa
                 
endm



print macro message
                 pusha
                 mov   ah,9
                 mov   dx,offset message
                 int   21h
                 popa
                endm










;; desc : macro to tansfer the index of an array to it's correspinding row and col 
; inputs :taks x which is the index
; output: stores the row and col in row and col  
get_cellLocation macro x 
pusha 
mov ax,x
mov bh,8
DIV bh
mov row,al 
mov col,ah
popa
endm


GUI_getNowColor proc
pusha
mov dl,selectedCell_row
mov dh,selectedCell_col
mov bh,row
mov selectedCell_row,bh
mov bh,col
mov selectedCell_col,bh
call GUI_getColor
mov selectedCell_row,dl
mov selectedCell_col,dh
popa
ret
GUI_getNowColor endp

;; inputs: c
;; Description: print the char c
;; inputs :NULL
    ;Descritpion: A proc that checks whether the entered name is valid or not
isValidName proc
                 pusha
                 mov   ah,user1
                 cmp   ah,'A'
                 jl    wrong
                 cmp   ah,'Z'
                 jle   go
                 cmp   ah,'a'
                 jl    wrong
                 cmp   ah, 'z'
                 jle   go
    wrong:         
                 print notValidName
      jmp exit1

    go:   
            mov  cur+1,20 
            call SET_CURSOR    
            print validName

             exit1:
                 popa

                 ret
isValidName endp


; inputs: NULL
; Description:initializing the main screen  to show the main screen to the user
MAINSCREEN_init proc
pusha
 ;clear screen
 again:
                 mov   ax,3
                 int   10h
                 print msg
    ;  mov
    ; pos is x,, pos+1 yy
               
                 mov   cur,4
                 mov   cur+1,1
                 call  SET_CURSOR
                 call  get_username
                 inc   cur+1
                 call  SET_CURSOR
                 call  isValidName
                 call CURSOR_getPosition
                 cmp cur+1,20;if the valid message is printed in isValidName then this would be true else it would be false
                 je goo 
                 ;;wait for user to press ENTER
                 re3:
                 mov ah,0
                 int 16h 
                 cmp ah,28;; scan code of ENTER
                 jne re3
                jmp again
goo:
pusha
re1:
mov ah,0
int 16h
cmp ah,28
jne re1
popa

popa
ret
MAINSCREEN_init endp


;;inputs:NULL
;Descritiion: UI screen responsible to show the interface screen and wait for the user option 
UI_init proc
pusha
; clearing the screen
 mov   ax,3
 int   10h

 ;; printing the messages
mov cur,28
mov cur+1,8
call SET_CURSOR
print chatMSG
mov cur+1,10
call SET_CURSOR
print startMSG
mov cur+1,12
call SET_CURSOR
print endMSG
mov cur,0
mov cur+1,22
call SET_CURSOR
print rr

;; checking for a valid opotion
;; in Phase 2 the next lines will be edited not to move forward to the next stage but wait for user 2 to accept the invite for your option

pusha
re2:
mov ah,0
int 16h
cmp ah,59; scan code of F1
jne conn1
;; delay the user until we recieve the scan code of F1
mov bh,59
mov VALUE,BH
call UART_transmit
mov bh,0
mov cur,bh
mov bh,23
mov cur+1,bh
call SET_CURSOR
print inviteChat
;; check
cmp lastStage,59
jne wait1 
mov bh,1
mov stage ,bh
jmp exit2 

wait1:
call UART_rec
mov ah,1
int 16h
jz ty
cmp ah,1 ; scan code of ESC
jne ty
mov bh,VALUE
mov lastStage,bh
jmp exit2
ty:
cmp rec_bool,1
je yes 
jmp wait1
yes:
cmp VALUE,59
je timeto
mov bh,0
mov rec_bool,bh
jmp wait1


timeto:
mov bh,0
mov rec_bool,bh
mov stage,1
jmp exit2

re4:
jmp re2

conn1:
cmp ah,60 ;scan code of F2
jne conn2


mov bh,60
mov VALUE,bh
call UART_transmit
print invitePlay
cmp lastStage,2
jne wait2
mov bh,2
mov stage,2
jmp exit2
wait2:
call UART_rec
mov ah,1
int 16h
jz ty1
cmp ah,1
jne ty1
mov bh,VALUE
mov lastStage,bh
jmp exit2
ty1:
cmp rec_bool,1
je yes1
jmp wait2
yes1:
cmp VALUE,60
je timeto1
mov bh,0
mov rec_bool,bh
jmp wait2

timeto1:
mov bh,0
mov rec_bool,bh
mov stage,2
jmp exit2
conn2:


exit2:
mov bh,0
mov rec_bool,bh
popa
popa
ret
UI_init endp

; inputs::NULL
;;Description:: proc to clear player 1 screen , used when player 1 chat space is full
;;This is used only in chat room
PLAYER1_clearScreen proc
pusha
pusha
mov ax,0600h
mov cl,0
mov bh,07 
mov ch,2 
mov dx,0B4FH
int 10h
popa
;;
mov cur,bh
mov cur+1,2
mov last1,2
call SET_CURSOR
popa
ret
PLAYER1_clearScreen endp

; inputs::NULL
;;Description:: proc to clear player 2 screen , used when player 2 chat space is full
;;This is used only in chat room

PLAYER2_clearScreen proc
pusha
pusha
mov ax,0600h
mov cl,0
mov bh,07 
mov ch,14 
mov dx,164FH
int 10h
popa
;;
mov cur,bh
mov cur+1,14
mov last2,14
call SET_CURSOR
popa
ret
PLAYER2_clearScreen endp





print_char macro c
                 pusha
             mov ah,2 
             mov dl,c
               int 21h
                 popa
                 
endm
print macro message
                 pusha
                 mov   ah,9
                 mov   dx,offset message
                 int   21h
                 popa
                endm


;;UART MODULE 

;; uart is used with 9600 divisor 
;; proc that initalzie the UART
UART_init proc 
pusha

  ; initinalize COM
    ;Set Divisor Latch Access Bit
    mov dx,3fbh 			; Line Control Register
    mov al,10000000b		;Set Divisor Latch Access Bit
    out dx,al				;Out it
    ;Set LSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f8h			
    mov al,0ch			
    out dx,al

    ;Set MSB byte of the Baud Rate Divisor Latch register.
    mov dx,3f9h
    mov al,00h
    out dx,al

;; we are working with 9600 Baud rate



    ;Set port configuration
    mov dx,3fbh
    mov al,00011011b
    out dx,al

popa
ret
UART_init endp

;; 



;; UART Polling mode
;; this proc takes  
UART_transmit proc
pusha
mov bh,0
mov tra_bool,bh
transmit:
       mov dx , 3FDH		; Line Status Register
            In al , dx 			;Read Line Status
            AND al , 00100000b
            jz transmit  

            ex1:
        mov tra_bool,1;indication
;; transmitting the data 
          mov dx , 3F8H		; Transmit data register
            mov al,VALUE
            out dx , al 
;; transmitting is done 
popa
ret
UART_transmit endp


;; when reieving we are not using polling mode 
;; we know if there is data is recieved using the rec_bool

UART_rec proc
pusha
mov bh,0
mov rec_bool,bh
    ;Check that Data Ready
            mov dx , 3FDH		; Line Status Register
            	in al , dx 
            AND al , 1
            
             jz ex5
               ;  ;If Ready read the VALUE in Receive data register
           mov bh,1
           mov rec_bool,bh
           mov dx ,03F8H
           in al,dx
           mov VALUE,al
           jmp ex2

           ex5:
           mov bl ,0
           mov rec_bool,bl
           mov bh,-1
           mov VALUE,bh
           ex2:
          popa
ret
UART_rec endp


  ; ;If empty put the VALUE in Transmit data register
  ;           mov dx , 3F8H		; Transmit data register
  ;           mov al,"A"
  ;           out dx , al 


  ;  ;If Ready read the VALUE in Receive data register
  ;           mov dx , 03F8H
  ;           in al , dx 
  ;           mov VALUE , al






;; CHAT MODULE 



CHAT_init proc
pusha

; clearing the screen
 mov   ax,3
 int   10h
 mov bh,0
 mov exitChat_bool,bh
 mov bh,player1_start
mov last1_row,bh
mov bh,0
mov cur,bh
mov bh,player2_start
mov last2_row,bh
mov bh,11
mov cur+1,bh
call SET_CURSOR
print rr
print str1
print ':'
mov bh,0
mov cur,bh
mov cur+1,bh
call SET_CURSOR
print str2

mov bh,0
mov cur,bh
mov bh,23
mov cur+1,bh
call SET_CURSOR
print rr
mov bh,0
mov cur,bh
mov bh,24
mov cur+1,bh
print exitChat

mov tra_bool,bh
mov rec_bool,bh
mov bh,3
mov shift,bh
mov last1_col,bh
mov last2_col,bh



popa
ret
CHAT_init endp


CHAT_printRecieved proc 

pusha

;; check is something meant to be recieved
call UART_rec
cmp rec_bool,1
jne lz1
  ;  ;If Ready read the VALUE in Receive data register
  ;  pusha
  ;           mov dx , 03F8H
  ;           in al , dx 
  ;           mov VALUE , al
           
            mov rec_bool,0
            mov bh,last2_col
            mov cur,bh
            mov bh,last2_row
            mov cur+1,bh
            call SET_CURSOR
;; exit logic 
cmp VALUE,0
jne enterz
mov bh,1
mov exitChat_bool,bh
   jmp lz1


   enterz:         ;; enter logic 
cmp VALUE,13
jne backspace2
mov bh,cur+1
inc bh
mov cur+1,bh
mov bh,player2_end
cmp cur+1,bh

jne reg2
call CHAT_player2Clear
mov bh,player2_start
mov last2_back,bh
lz1:
jmp nochat

reg2:
mov bh,shift
cmp cur,bh
je nostore2
mov bh,cur+1
mov last2_back,bh

nostore2:
mov bh,shift
mov last2_col,bh 
mov cur,bh
mov bh,cur+1
mov last2_row,bh
call SET_CURSOR
jmp nochat


backspace2:
cmp VALUE,8
jne Rec__
cmp cur,0
je cv2
mov bh,shift
cmp cur,bh
jne ad2
cv2:
mov bh,last2_back
cmp cur+1,bh
je nochat
cmp cur,0
jne ad2
mov bh,79
mov cur,bh
mov last2_col,bh
mov bh,cur+1
dec bh
mov cur+1,bh
mov last2_row,bh
jmp bd2 
ad2:
mov bh,cur
dec bh
mov cur,bh
mov last2_col,bh
bd2:
call SET_CURSOR
print_char 0
call SET_CURSOR
jmp nochat


Rec__:
           
            call CURSOR_getPosition
            mov bh,player2_end
            cmp cur+1,bh
            jne avdd2
            cmp cur,79
            jne avdd2
            call CHAT_player2Clear

avdd2:
 print_char VALUE
 call CURSOR_getPosition
          mov bh,cur
            mov last2_col,bh
            mov bh,cur+1
            mov last2_row,bh
nochat:
 popa
ret
CHAT_printRecieved endp 



CHAT_sendChat proc 
pusha
;; reset cursor to my side
mov bh,last1_col
  mov cur,bh
  mov bh,last1_row
  mov cur+1,bh
  call SET_CURSOR


mov ah,1
int 16h
 jz ki4

;; checking bug keys and exit F3

cmp ah,72;; scan code of up arrow
je ki4
cmp ah,75;; scan code of left arrow
je ki4
cmp ah,77;;scan code of right
je ki4
cmp ah,80;;scan code of down
je ki4
cmp ah,59;; scan code of F1
je ki4
cmp ah,60;; scan code of F2
je ki
 ;; checking if it is F3 key is pressed 
cmp ah,61
jne F4
mov bh,1
mov exitChat_bool,bh 
mov bh,0
mov VALUE,bh
call UART_transmit
jmp ki
F4:
cmp ah,62;; scan code of F4
je ki
cmp ah,63;; scan code of F5
je ki
cmp ah,64;; scan code of F6
je ki
cmp ah,65;; scan code of F7
je ki
cmp ah,66;; scan code of F8
je ki
cmp ah,67;; scan code of F9
je ki
cmp ah,68;; scan code of F10
je ki
cmp ah,133;; scan code of F11
je ki
cmp ah,134;; scan code of F12
je ki
cmp ah,83;; scan code of del
je ki
;; checking if we reached the limit of any player
;; assuming its player 1
call CURSOR_getPosition
jmp nobug
;; player 1
ki4:
jmp ki

nobug:
 mov VALUE,al
call UART_transmit
;  mov tra_bool,0
cmp al,13
jne backSpace

mov bh,cur+1
inc bh
mov cur+1,bh
mov bh,player1_end
cmp cur+1,bh
jne reg1 
call CHAT_player1Clear
mov bh,player1_start
mov last1_back,bh
ki:
jmp outsend


reg1:
mov bh,shift
cmp cur,bh
je nostore
; mov bh,player1_start
; mov cur,bh
; call SET_CURSOR
; mov bh,player1_start
; mov last1_col,bh 
mov bh,cur+1
mov last1_back,bh

nostore:
mov bh,shift
mov last1_col,bh 
mov cur,bh
mov bh,cur+1
mov last1_row,bh
call SET_CURSOR
jmp outsend


backSpace:
cmp al,8
jne printChat
cmp cur ,0
je cv
mov bh,shift
cmp cur,bh
jne ad

cv:
mov bh,last1_back
cmp cur+1,bh
je outsend
cmp cur,0
jne ad
mov bh,79
mov cur,bh
mov last1_col,bh
mov bh,cur+1 
dec bh
mov cur+1,bh
mov last1_row,bh
jmp bd
ad:
mov bh,cur
dec bh
mov cur,bh
mov last1_col,bh
bd:
call SET_CURSOR
print_char 0
call SET_CURSOR
jmp outsend

printChat:

   call CURSOR_getPosition
   mov bh,player1_end
cmp cur+1,bh
jne avdd
cmp cur,79
jne avdd
call CHAT_player1Clear
avdd:
            print_char al
            CALL CURSOR_getPosition
            mov bh,cur
            mov last1_col,bh
            mov bh,cur+1
            mov last1_row,bh
 
            outsend:
popa
ret
CHAT_sendChat endp


; inputs::NULL
;;Description:: proc to clear player 1 screen , used when player 1 chat space is full
;;This is used only in chat room


CHAT_player1Clear proc 
pusha


mov ax,0600h
mov cl,0
mov bh,07 
mov ch,1
mov dx,0A4FH
int 10h

mov bh,shift
mov cur,bh
mov last1_col,bh
mov bh,player1_start
mov cur+1,bh
mov last1_row,bh
call SET_CURSOR
mov bh,player1_start
mov last1_back,bh

popa  
ret

CHAT_player1Clear endp



CHAT_player2Clear proc 
pusha



mov ax,0600h
mov cl,0
mov bh,07 
mov ch,13
mov dx,164FH
int 10h

mov bh,shift
mov cur,bh
mov last2_col,bh
mov bh,player2_start
mov cur+1,bh
mov last2_row,bh
call SET_CURSOR
mov bh,player2_start
mov last2_back,bh

popa  
ret

CHAT_player2Clear endp






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Chat Above



print_char macro c
                 pusha
             mov ah,2 
             mov dl,c
               int 21h
                 popa
                 
endm



print macro message
                 pusha
                 mov   ah,9
                 mov   dx,offset message
                 int   21h
                 popa
                endm










;; desc : macro to tansfer the index of an array to it's correspinding row and col 
; inputs :taks x which is the index
; output: stores the row and col in row and col  
get_cellLocation macro x 
pusha 
mov ax,x
mov bh,8
DIV bh
mov row,al 
mov col,ah
popa
endm


;; description : proc that dehiglight the vali cells of a piece after the movement 
;; it doesn't assume that the player has made a right move it just update everything 
;; inputs : NULL


GUI_deHighlightValidCells proc
pusha
lea di,valid_cells1
;; need to traverse in the valid_cells to see where is the ones and flip it
;; but before fliping it we need to redraw the cell and look for chis board pieces after the movement 
mov cx,0
;; store your row and col 
mov dl,row
mov dh,col

check:
mov bh,1
cmp [di],bh
jne ag
;; highligted then need to redraw the cell first
get_cellLocation cx
;; now our cell row and col are stored
pusha
call get_position
popa
call GUI_getNowColor
mov ax,25
mov rec,ax
call draw_cell
;; now check for any pieces in this location 
call GUI_getObject
;; object is stored in now object 
cmp nowObject,0
je non
;; we have an object
pusha
call GUI_getObject
mov al,nowObject
call get_offset_of_piece
call draw_piece
popa
non:

;; set the cell to not valid 
mov bh,0
mov [di],bh
ag:
inc di
inc cx
cmp cx,64
jne check
;; end return your row and col 
mov row,dl
mov col,dh
popa
ret
GUI_deHighlightValidCells endp




GUI_deHighlightValidCells1 proc
pusha

lea di,valid_cells2
;; need to traverse in the valid_cells to see where is the ones and flip it
;; but before fliping it we need to redraw the cell and look for chis board pieces after the movement 
mov cx,0
;; store your row and col 
mov dl,row
mov dh,col

checkk:
mov bh,1
cmp [di],bh
jne agg

; ;; highligted then need to redraw the cell first
; get_cellLocation cx
; ;; now our cell row and col are stored
; pusha
; call get_position
; popa
; call GUI_getNowColor
; mov ax,25
; mov rec,ax
; call draw_cell
; ;; now check for any pieces in this location 
; call GUI_getObject
; ;; object is stored in now object 
; cmp nowObject,0
; je nonn
; ;; we have an object
; pusha
; call GUI_getObject
; mov al,nowObject
; call get_offset_of_piece
; call draw_piece
; popa

nonn:

;; set the cell to not valid 
mov bh,0
mov [di],bh
agg:
inc di
inc cx
cmp cx,64
jne checkk
;; end return your row and col 
mov row,dl
mov col,dh

popa
ret
GUI_deHighlightValidCells1 endp
;;2164
GUI_isHighlighted proc
pusha 
mov dl,row
mov dh,col








mov al,row
mov bl,8
mul bl
add al, col
lea di, valid_cells1
; lea si,valid_cells2
mov ah, 0
add di, ax
; add si, ax
mov bh,1
cmp [di],bh
jne nothigh1
; mov bh,1
; cmp [si],bh
; jne ply1
;; here 2 players cell so you jsut return 3 
; mov bh, 3
; mov isLighted_flag,bh
; jmp ol
ply1:
mov bh,1 
mov isLighted_flag,bh
jmp ol
nothigh1:
; mov bh, 1
; cmp [si],bh
; jne nothigh
; mov bh,2;; player 2 
; mov isLighted_flag,bh
; jmp ol
nothigh:

;; check for king 

call check_getKingsPos
cmp dl,King1_row
jne ki2
cmp dh,king1_col
jne ki2
;; handle the check and checkmate colors 

cmp whiteking_in_checkmate,1
jne cck
mov bh,5
mov isLighted_flag,bh
jmp ol
cck:
cmp whiteking_in_check,1
jne oz 
mov bh,4
mov isLighted_flag,4
jmp ol

ki2:
cmp dl,King2_row
jne oz
cmp dh,king2_col
jne oz


cmp whiteking_in_checkmate,1
jne cck
mov bh,5
mov isLighted_flag,bh
jmp ol

cck1:
cmp whiteking_in_check,1
jne oz 
mov bh,4
mov isLighted_flag,4
jmp ol


oz:
mov bh,0
mov isLighted_flag,0
ol:
popa
ret
GUI_isHighlighted endp



;;descriptioon:  a macro that is responsible to take row and col and updates the current object of this cell to a given value x\
;;inputs:-
;; x: the value to be assigned to the cell which specify the ID of the current object in the cell
;; row and col to specify the cell 
;; return : updates the ID of the current cell

GUI_updateBoard macro x
pusha
mov al,row
mov bl,8
mul bl
add al, col
lea di, chess_board
mov ah, 0
add di, ax
;; here we just update the value
mov bh,x
mov [di],bh
popa
endm
;;descriptioon:  proc responsible to know wt object is in the cell
;;inputs:-
;; row and col to specify the cell 
;; return : returns the ID of the object in nowObject

GUI_getObject proc
pusha
mov al,row
mov bl,8
mul bl
add al, col
lea di, chess_board
mov ah, 0
add di, ax
mov bh ,[di]
; mov bh,12
mov nowObject,bh
popa
ret
GUI_getObject endp
;; description : a proc responsble to get the color of the cell that we need to remove the piece from it 
;; called in GUI_deleteObject proc
;;inputs: selectedRow , selectedCol
;;return: returns the color of the cell stored in color
GUI_getColor proc
pusha
;; logic : if selectedRow+selectedCol= ODD->>>> then  it's grey
;; else then it's even ->>>> blue
mov al,selectedCell_row
add al,selectedCell_col
mov ah, 0
mov bh,2
DIV bh
cmp ah,0
jne gr
blu:
mov bh,68h
mov color,bh
jmp e
gr:
mov bh,19H
mov color,bh
e:
popa
ret
GUI_getColor endp


;; description: proc responsible to delete an object 
;; this proc is called in GUI_isValid proc
;; inputs: pos and color
;; return : updates the object to its new cell
GUI_deleteObject proc
pusha
mov dl,row
mov dh,col
mov bh,selectedCell_row
mov row,bh
mov bh,selectedCell_col
mov col,bh
pusha
call get_position
popa
; ;; now we have the position of the initial cell
mov bx,pos
mov ax,25
mov rec,ax
call GUI_getColor;; get the color
call GUI_getObject;; get the object of the chess
call draw_cell;; draw the cells
GUI_updateBoard 0   ;; update the cell to 0 'as we deleted the object'
mov pos ,bx
mov row,dl
mov col,dh
pusha
;; here we need to get the pos of the new cell and draw the piece in it
call get_position
popa
pusha

mov dl,nowObject
; cmp bx,0
; jne bb

call GUI_getObject
mov bh,nowObject
mov nowKilled,bh
cmp nowObject,0
je dr


;; the problem is that selected row and selected col is the parameters of the GUI_getColor
pusha
mov bl,selectedCell_row
mov bh,selectedCell_col
mov ah,row
mov selectedCell_row,ah
mov ah,col
mov selectedCell_col,ah
call GUI_getColor
mov selectedCell_row,bl
mov selectedCell_col,bh
popa

pusha
call get_position;;pos is stored
popa
call draw_cell
;;the logic of eating the enemy piece 
;; first get the object in this cell
;; cmp it with 0 if it is then jmp out if it is not then eat it 




dr:
mov al,dl
call get_offset_of_piece
call draw_piece;; draw the piece
pusha
mov al,50h
call highlight
popa
GUI_updateBoard dl
bb:
popa
popa
ret
GUI_deleteObject endp



;; Function description:  this proc is respnsible to deal with player 1 all logic combined 
;; user is only allowed to move with {Left arrow,Right arrow,Up arrow,down arrow}
;; inputs:   it takes the user click as an input and updates the row1 and col1
GUI_move1 proc
pusha
;; get the user click 
mov bh,1
mov nowPlayer,bh
 mov ah,1
 int 16h
 jz lk1
cmp ah,1
jne kl
;; esc is pressed 
mov bh,1
mov go_main,bh
mov TRA_action,bh
jmp cz6
kl:
cmp ah,75;; left arrow scan codde
jne ra
cmp col,0
je ddd1
call inverse_highlight
mov bh,col
dec bh
mov col,bh
mov al,cursorColor1
; call Player_switch
call highlight
; call Player_switch
mov bl,75
mov TRA_action,bl
lk1:
jmp cz6

ra:
cmp ah,77;; right scan code 
jne ua
cmp col,7
je ddd
; call Player_switch
call inverse_highlight
; call Player_switch
; inc col
mov bh,col
inc bh
mov col,bh
mov al,cursorColor1
; call Player_switch
call highlight
; call Player_switch
ddd:
mov bl,77
mov TRA_action,bl
ddd1:
jmp cz6

ua:
cmp ah,72
jne da

cmp row,0
je ddd1
; call Player_switch
call inverse_highlight
; call Player_switch
; dec row
mov bh,row
dec bh
mov row,bh
mov al,cursorColor1
; call Player_switch
call highlight
; call Player_switch
mov bl ,80
mov TRA_action,bl
jmp cz6

da:
cmp ah,80
jne log

mov bl,72
mov TRA_action,bl
cmp row,7
je ddd1
; call Player_switch
call inverse_highlight
; call Player_switch
mov bh,row
inc bh
mov row,bh
mov al,cursorColor1
; call Player_switch
call highlight
; call Player_switch
jmp cz6




log:

cmp ah,53
m:
je gk
mov bh,1
mov nowChat,al
mov game_flag,0
jmp bbb
gk:
mov bh,click_flag
; inc click_flag
inc bh
mov click_flag,bh
cmp click_flag,3
jne czz 
mov bh,1
mov click_flag,bh
; mov click_flag,1

;;logic part
czz:
cmp click_flag,1
jne cz12

;; check for time
; call player_switch
call Time_canMove
; call player_switch
cmp canMove_flag,1
je hecan1
;;can't?
;; reset the flag
mov bh,0
mov click_flag,bh
jmp bbb

hecan1:
;; send the action 
mov bh,53
mov TRA_action,bh
;; saving current cell
; call Player_switch
call GUI_getObject
; call Player_switch
cmp nowObject,6;; dont save dont do anything ,, onky dec your click_user to go back in first step 
ja vall2
re:
mov bh,0
mov click_flag,bh;; reseting clicks of the player
jmp cz22

vall2:
; cmp nowObject,0
; je re
pusha
mov bl,row 
mov selectedCell_row,bl
mov bl,col
mov selectedCell_col,bl
popa
;; call proc show highlighting that is valid 

; call Player_switch
call highlight_valid_cells1
; call Player_switch
;  call GUI_validForBoth
;;redraw cursor player 1

mov al,cursorColor2
call player_switch
call highlight
call player_switch
bbb:
jmp cz22

cz12:
cmp click_flag,2

jne bbb
;; check if the user clicks on the same cell which means that the user wants to disable the selection
mov bh,53
mov TRA_action,bh
mov bh,selectedCell_row
cmp row,bh
jne cq2
mov bh,selectedCell_col
cmp bh,col
jne cq2
; if it doesnt jmp here this means our condition is true
;;let the click_user be 0 again 
mov bh,0
mov click_flag,bh
;;To Do : call the function that disable the highlight of the piece
; call check_clear
call highlight_valid_cells1
call player_switch
call highlight_valid_cells2
call player_switch
; call highlight_valid_cells1
call check_inCheck
call GUI_deHighlightValidCells
call GUI_deHighlightValidCells1
call check_update

;; redraw cursor of player 1





h1:
; ;;handle overwrite highlight of players
; cmp click_flag1,1
; jne pp
; pusha
; mov dl,row
; mov dh, col
; mov bh, selectedCell_row1
; mov row,bh
; mov bh,selectedCell_col1
; mov col,bh
; call GUI_deHighlightValidCells
; call highlight_valid_cells1;; because player 2 could be highlighting the same cells
; mov row,dl
; mov col,dh
; popa
pp:


mov al,cursorColor1
call highlight
mov al,cursorColor2
call player_switch
call highlight
call player_switch
jmp cz22;; ignore it 

cq2:

;; call the procc that checks the if this cell is valid or not

call GUI_isValid
call GUI_deHighlightValidCells
;; check handle
call check_update
;; handle if the player is eating the cell it should disable the other color 

;;first check the cell that you are going to eat if it matches the the selected cell of the second player then your case is true and you need to dehighlight 
; ;; else it means that you are eating another piece and not tthe piece that the  enemy is higighting so you de highlight 
; mov bh,selectedCell_row
; cmp row1,bh
; jne lz
; mov bh,selectedCell_col
; cmp col1,bh
; jne lz
; call GUI_deHighlightValidCells
; mov bh,0
; mov click_flag,bh
; jmp pp1

; lz:
; jmp h1
pp1:


mov al,cursorColor1
call highlight

mov al,cursorColor2
call Player_switch
call highlight
call Player_switch
; mov color,19H
cz22:

cz6:
;; flush the keyboard buffer
; mov al,01h
; mov ah,0Ch
; int 21h 

mov ah, 6
mov dl, 255
int 21h 


popa
ret
GUI_move1 endp



GUI_move2   proc
pusha
mov bh,2
mov nowPlayer,bh
mov bl ,al
; mov ah, 6
; mov dl, 255
; int 21h 
cmp REC_action,1
jne nl
mov bh,1
mov go_main,bh
jmp ex3
nl:

cmp REC_action,1
jne loz
mov bh,1
mov go_main,bh
jmp ex3
loz:
cmp REC_action,75;; left arrow scan codde
jne s
cmp col1,0
je b
call Player_switch
call inverse_highlight
call Player_switch
mov bh,col1
dec bh
mov col1,bh
mov al,cursorColor2
call Player_switch
call highlight
call Player_switch
jmp ex3
; a1:
; cmp al,'A'
; jne s
; cmp col,0
; je b
; call inverse_highlight
; mov bh,col
; dec bh
; mov col,bh
; mov al,bl
; call highlight
; jmp ex3



s:
cmp REC_action,77;; right scan code 
jne d
cmp col1,7
je b
call Player_switch
call inverse_highlight
call Player_switch
; inc col
mov bh,col1
inc bh
mov col1,bh
mov al,cursorColor2
call Player_switch
call highlight
call Player_switch
b:
jmp ex3
; s1:
; cmp al,'S'
; jne d
; cmp row,7
; je b
; call inverse_highlight
; mov bh,row
; inc bh
; mov row,bh
; mov al,bl
; call highlight
; jmp ex3


d:
cmp REC_action,72
jne w


cmp row1,0
je b
call Player_switch
call inverse_highlight
call Player_switch
; dec row
mov bh,row1
dec bh
mov row1,bh
mov al,cursorColor2
call Player_switch
call highlight
call Player_switch
jmp ex3


; d1:
; cmp al,'D'
; jne w
; cmp col,7
; je b
; call inverse_highlight
; mov bh,col
; inc bh
; mov col,bh
; mov al,bl
; call highlight
; jmp ex3




w:
cmp REC_action,80
jne q
cmp row1,7
je f

call Player_switch
call inverse_highlight
call Player_switch
mov bh,row1
inc bh
mov row1,bh
mov al,cursorColor2
call Player_switch
call highlight
call Player_switch
jmp f
; w1:
; cmp al,'W'
; jne q
; cmp row,0
; je f
; call inverse_highlight
; mov bh,row
; inc bh
; mov row,bh
; mov al,bl
; call highlight
f:
jmp ex3
;; To Do: seperate the logic of the click to a proc to be more readable



q:
cmp REC_action,53
jne mz
clcc:
mov bh,click_flag1
; inc click_flag
inc bh
mov click_flag1,bh
cmp click_flag1,3
jne cz 
mov bh,1
mov click_flag1,bh
; mov click_flag,1

;;logic part
cz:
cmp click_flag1,1
jne cz1
;; check for the time

; call player_switch
; call Time_canMove
; call player_switch
; cmp canMove_flag,1
; je hecan
; ;; can't?
; ; reset the click flag 
; mov bh,0
; mov click_flag1,bh
;; i wo'nt highlight or select the cell or do anything just break
; jmp mz
hecan:
;; saving current cell
call player_switch
call GUI_getObject
call player_switch
cmp nowObject,7;; dont save dont do anything ,, onky dec your click_user to go back in first step 
jl vall
mov bh,0
mov click_flag1,bh;; reseting clicks ofthe player
jmp cz2

vall:
pusha
mov bl,row1 
mov selectedCell_row1,bl
mov bl,col1
mov selectedCell_col1,bl
popa
;; call proc show highlighting that is valid
call player_switch
call highlight_valid_cells2
call player_switch
;  call GUI_validForBoth
;; handling if i over drew the cursor2 player
; mov al,cursorColor2
; call player_switch
; call highlight
; call player_switch
mz:
jmp cz2

cz1:
cmp click_flag1,2
jne mz
;; check if the user clicks on the same cell which means that the user wants to disable the selection

mov bh,selectedCell_row1
cmp row1,bh
jne cq
mov bh,selectedCell_col1
cmp bh,col1
jne cq
; if it doesnt jmp here this means our condition is true
;;let the click_user be 0 again 
mov bh,0
mov click_flag1,bh
;;To Do : call the function that disable the highlight of the piece 
; call check_clear
call highlight_valid_cells1
call player_switch
call highlight_valid_cells2
call player_switch
call check_inCheck
call GUI_deHighlightValidCells
call GUI_deHighlightValidCells1
call check_update
;; redraw cursor of player 2

ul1:

cmp click_flag,1
jne p
pusha
mov dl,row
mov dh,col
mov bh,selectedCell_row
mov row,bh
mov bh,selectedCell_col
mov col,bh
call GUI_deHighlightValidCells
call highlight_valid_cells1
mov row,dl
mov col,dh
popa

p:

mov al,cursorColor2
call player_switch
call highlight
call player_switch
;;handle redraw my cursor
mov al,cursorColor1
call highlight
jmp cz2;; ignore it 

cq:

;; call the procc that checks the if this cell is valid or not 
call GUI_isValid1

call GUI_deHighlightValidCells1
call check_update


;; handle if the player is eating the cell it should disable the other color 

;;first check the cell that you are going to eat if it matches the the selected cell of the second player then your case is true and you need to dehighlight 
;; else it means that you are eating another piece and not tthe piece that the  enemy is higighting so you de highlight 

mov bh,selectedCell_row
cmp row1,bh
jne gg
;;look for col now 
mov bh,selectedCell_col
cmp col1,bh
jne gg

;;  the case is true in this block  true 
;; we need to dehighlight
call GUI_deHighlightValidCells;; de highlighting 
;; let his click flag be equal to zero 
mov bh,0
mov click_flag,bh
jmp p1

gg:
jmp ul1

p1:

mov al,cursorColor1
call highlight
mov al,cursorColor2
call player_switch
call highlight
call player_switch
; mov color,19H
cz2:
jmp ex3
q1:
; ;; To Do : need to handle the same logic in the CAPS q

; cmp al,'Q'
; jne ex3
; inc click_flag
; cmp click_flag,3
; jne cz3 
; mov click_flag,1
; cz3:
; cmp click_flag,1
; jne cz4
; ;; call proc show highlighting that is valid


; cz4:
; cmp click_flag,2
; jne ex3
; ;; call the procc that checks the if this cell is valid or not

; call GUI_isValid

ex3:
mov bh,-1
mov REC_action,bh
popa
ret
  GUI_move2 endp






















; GUI_move2 proc
; pusha


 
; cmp REC_action,75;; left arrow scan codde
; jne ra
; cmp col1,0
; je ddd
; call Player_switch
; call inverse_highlight
; call Player_switch
; mov bh,col1
; dec bh
; mov col1,bh
; mov al,cursorColor2
; call Player_switch
; call highlight
; call Player_switch
; jmp cz6

; ra:
; cmp REC_action,77;; right scan code 
; jne ua
; cmp col1,7
; je ddd
; call Player_switch
; call inverse_highlight
; call Player_switch
; ; inc col
; mov bh,col1
; inc bh
; mov col1,bh
; mov al,cursorColor2
; call Player_switch
; call highlight
; call Player_switch
; ddd:
; jmp cz6

; ua:
; cmp REC_action,72
; jne da

; cmp row1,0
; je ddd
; call Player_switch
; call inverse_highlight
; call Player_switch
; ; dec row
; mov bh,row1
; dec bh
; mov row1,bh
; mov al,cursorColor2
; call Player_switch
; call highlight
; call Player_switch


; da:
; cmp REC_action,80
; jne log

; cmp row1,7
; je ddd
; call Player_switch
; call inverse_highlight
; call Player_switch
; mov bh,row1
; inc bh
; mov row1,bh
; mov al,cursorColor2
; call Player_switch
; call highlight
; call Player_switch
; jmp cz6




; log:

; cmp REC_action,53
; m:
; jne bbb

; mov bh,click_flag1
; ; inc click_flag
; inc bh
; mov click_flag1,bh
; cmp click_flag1,3
; jne czz 
; mov bh,1
; mov click_flag1,bh
; ; mov click_flag,1

; ;;logic part
; czz:
; cmp click_flag1,1
; jne cz12

; ;; check for time
; call player_switch
; call Time_canMove
; call player_switch
; cmp canMove_flag,1
; je hecan1
; ;;can't?
; ;; reset the flag
; mov bh,0
; mov click_flag1,bh
; jmp bbb

; hecan1:
; ;; saving current cell
; call Player_switch
; call GUI_getObject
; call Player_switch
; cmp nowObject,7;; dont save dont do anything ,, onky dec your click_user to go back in first step 
; jl vall2
; re:
; mov bh,0
; mov click_flag1,bh;; reseting clicks of the player
; jmp cz22

; vall2:
; cmp nowObject,0
; je re
; pusha
; mov bl,row1 
; mov selectedCell_row1,bl
; mov bl,col1
; mov selectedCell_col1,bl
; popa
; ;; call proc show highlighting that is valid 

; call Player_switch
; call highlight_valid_cells2
; call Player_switch
;  call GUI_validForBoth
; ;;redraw cursor player 1
; mov al,cursorColor1
; call highlight
; bbb:
; jmp cz22

; cz12:
; cmp click_flag1,2

; jne bbb
; ;; check if the user clicks on the same cell which means that the user wants to disable the selection

; mov bh,selectedCell_row1
; cmp row1,bh
; jne cq2
; mov bh,selectedCell_col1
; cmp bh,col1
; jne cq2
; ; if it doesnt jmp here this means our condition is true
; ;;let the click_user be 0 again 
; mov bh,0
; mov click_flag1,bh
; ;;To Do : call the function that disable the highlight of the piece
; ; call check_clear
; call player_switch
; call highlight_valid_cells2
; call player_switch
; call highlight_valid_cells1
; call check_inCheck
; call GUI_deHighlightValidCells1
; call GUI_deHighlightValidCells
; call check_update

; ;; redraw cursor of player 1





; h1:
; ;;handle overwrite highlight of players
; cmp click_flag,1
; jne pp
; pusha
; mov dl,row
; mov dh, col
; mov bh, selectedCell_row
; mov row,bh
; mov bh,selectedCell_col
; mov col,bh
; call GUI_deHighlightValidCells
; call highlight_valid_cells1;; because player 2 could be highlighting the same cells
; mov row,dl
; mov col,dh
; popa
; pp:


; mov al,cursorColor1
; call highlight
; mov al,cursorColor2
; call player_switch
; call highlight
; call player_switch
; jmp cz22;; ignore it 

; cq2:

; ;; call the procc that checks the if this cell is valid or not

; call GUI_isValid1
; call GUI_deHighlightValidCells1
; ;; check handle
; call check_update
; ;; handle if the player is eating the cell it should disable the other color 

; ;;first check the cell that you are going to eat if it matches the the selected cell of the second player then your case is true and you need to dehighlight 
; ;; else it means that you are eating another piece and not tthe piece that the  enemy is higighting so you de highlight 
; mov bh,selectedCell_row
; cmp row1,bh
; jne lz
; mov bh,selectedCell_col
; cmp col1,bh
; jne lz
; call GUI_deHighlightValidCells
; mov bh,0
; mov click_flag,bh
; jmp pp1

; lz:
; jmp h1
; pp1:


; mov al,cursorColor1
; call highlight
; mov al,cursorColor2
; call Player_switch
; call highlight
; call Player_switch
; ; mov color,19H
; cz22:

; cz6:
; ;; flush the keyboard buffer
; ; mov al,01h
; ; mov ah,0Ch
; ; int 21h 
; ; mov al,0
; ; mov ah,0Ch
; ; int 21h
; mov ah, 6
; mov dl, 255
; int 21h 
; mov bh,-1
; mov REC_action,bh
; popa
; ret
; GUI_move2 endp

;; following proccs are made to use player1 procs in player 2 logic to avoid creating more procs 
;; all we need is to flip the row and col of player 1 and assign them to the player's 2 row and col then once we are done we return them back 
;; so we have 2 procs // Switch     // deSwitch and those are called before and after of the calling of player1 procs in player 2 logic 



;; swithc the row with row1 and col with cooll1 
Player_switch   proc
pusha
mov al,row1
mov bl,row 
mov row1,bl
mov row,al

mov al,col1
mov bl,col 
mov col1,bl
mov col,al
popa
ret
Player_switch endp





;; Function description:  this proc is respnsible to deal with player 1 all logic combined 
;; user is only allowed to move with {w,a,s,d}
;; inputs:   it takes the user click as an input and updates the row and col

; GUI_move1   proc
; pusha
; mov bh,1
; mov nowPlayer,bh
; mov bl ,al
;  mov ah,1
;  int 16h 
; cmp al,'a'
; je a1
; cmp al,'A'
; jne s
; a1:
; cmp col,0
; je b
; call inverse_highlight
; mov bh,col
; dec bh
; mov col,bh
; mov al,bl
; call highlight
; jmp ex3
; ; a1:
; ; cmp al,'A'
; ; jne s
; ; cmp col,0
; ; je b
; ; call inverse_highlight
; ; mov bh,col
; ; dec bh
; ; mov col,bh
; ; mov al,bl
; ; call highlight
; ; jmp ex3
; s:
; cmp al,'s'
; je s1
; cmp al,'S'
; jne d
; s1:
; cmp row,7
; je b
; call inverse_highlight
; mov bh,row
; inc bh
; mov row,bh
; mov al,bl
; call highlight
; b:
; jmp ex3
; ; s1:
; ; cmp al,'S'
; ; jne d
; ; cmp row,7
; ; je b
; ; call inverse_highlight
; ; mov bh,row
; ; inc bh
; ; mov row,bh
; ; mov al,bl
; ; call highlight
; ; jmp ex3
; d:
; cmp al,'d'
; je d1
; cmp al,'D'
; jne w

; d1:
; cmp col,7
; je b
; call inverse_highlight
; ; inc col
; mov bh,col
; inc bh
; mov col,bh
; mov al,bl
; call highlight
; jmp ex3


; ; d1:
; ; cmp al,'D'
; ; jne w
; ; cmp col,7
; ; je b
; ; call inverse_highlight
; ; mov bh,col
; ; inc bh
; ; mov col,bh
; ; mov al,bl
; ; call highlight
; ; jmp ex3

; w:
; cmp al,'w'
; je w1 
; cmp al,'W'
; jne q
; w1:
; cmp row,0
; je f
; call inverse_highlight
; ; dec row
; mov bh,row
; dec bh
; mov row,bh
; mov al,bl
; call highlight
; jmp f
; ; w1:
; ; cmp al,'W'
; ; jne q
; ; cmp row,0
; ; je f
; ; call inverse_highlight
; ; mov bh,row
; ; inc bh
; ; mov row,bh
; ; mov al,bl
; ; call highlight
; f:
; jmp ex3
; ;; To Do: seperate the logic of the click to a proc to be more readable

; q:
; cmp al,'q'
; je clcc
; cmp al,'Q'
; je clcc
; jmp cz2
; clcc:
; mov bh,click_flag
; ; inc click_flag
; inc bh
; mov click_flag,bh
; cmp click_flag,3
; jne cz 
; mov bh,1
; mov click_flag,bh
; ; mov click_flag,1

; ;;logic part
; cz:
; cmp click_flag,1
; jne cz1
; ;; check for the time
; call Time_canMove
; cmp canMove_flag,1
; je hecan
; ;; can't?
; ; reset the click flag 
; mov bh,0
; mov click_flag,bh
; ;; i wo'nt highlight or select the cell or do anything just break
; jmp mz
; hecan:
; ;; saving current cell
; call GUI_getObject
; cmp nowObject,6;; dont save dont do anything ,, onky dec your click_user to go back in first step 
; ja vall
; mov bh,0
; mov click_flag,bh;; reseting clicks ofthe player
; jmp cz2

; vall:
; pusha
; mov bl,row 
; mov selectedCell_row,bl
; mov bl,col
; mov selectedCell_col,bl
; ; popa
; ; ;; call proc show highlighting that is valid
; ; call highlight_valid_cells1
; ;  call GUI_validForBoth
; ; ;; handling if i over drew the cursor2 player
; ; mov al,cursorColor2
; ; call player_switch
; ; call highlight
; ; call player_switch
; mz:
; jmp cz2

; cz1:
; cmp click_flag,2
; jne mz
; ;; check if the user clicks on the same cell which means that the user wants to disable the selection

; mov bh,selectedCell_row
; cmp row,bh
; jne cq
; mov bh,selectedCell_col
; cmp bh,col
; jne cq
; ; if it doesnt jmp here this means our condition is true
; ;;let the click_user be 0 again 
; mov bh,0
; mov click_flag,bh
; ;;To Do : call the function that disable the highlight of the piece 
; ; call check_clear


; ; call highlight_valid_cells1
; ; call player_switch
; ; call highlight_valid_cells2
; ; call player_switch
; ; call check_inCheck
; ; call GUI_deHighlightValidCells
; ; call GUI_deHighlightValidCells1
; ; call check_update


; ;; redraw cursor of player 2

; ul1:

; cmp click_flag1,1
; jne p
; pusha
; mov dl,row
; mov dh,col
; mov bh,selectedCell_row1
; mov row,bh
; mov bh,selectedCell_col1
; mov col,bh
; call GUI_deHighlightValidCells1
; call highlight_valid_cells2
; mov row,dl
; mov col,dh
; popa

; p:

; mov al,cursorColor2
; call player_switch
; call highlight
; call player_switch
; ;;handle redraw my cursor
; mov al,cursorColor1
; call highlight
; jmp cz2;; ignore it 

; cq:

; ;; call the procc that checks the if this cell is valid or not 
; call GUI_isValid

; call GUI_deHighlightValidCells
; call check_update


; ;; handle if the player is eating the cell it should disable the other color 

; ;;first check the cell that you are going to eat if it matches the the selected cell of the second player then your case is true and you need to dehighlight 
; ;; else it means that you are eating another piece and not tthe piece that the  enemy is higighting so you de highlight 

; mov bh,selectedCell_row1
; cmp row,bh
; jne gg
; ;;look for col now 
; mov bh,selectedCell_col1
; cmp col,bh
; jne gg

; ;;  the case is true in this block  true 
; ;; we need to dehighlight
; call GUI_deHighlightValidCells1;; de highlighting 
; ;; let his click flag be equal to zero 
; mov bh,0
; mov click_flag1,bh
; jmp p1

; gg:
; jmp ul1

; p1:

; mov al,cursorColor1
; call highlight
; mov al,cursorColor2
; call player_switch
; call highlight
; call player_switch
; ; mov color,19H
; cz2:
; jmp ex3
; q1:
; ; ;; To Do : need to handle the same logic in the CAPS q

; ; cmp al,'Q'
; ; jne ex3
; ; inc click_flag
; ; cmp click_flag,3
; ; jne cz3 
; ; mov click_flag,1
; ; cz3:
; ; cmp click_flag,1
; ; jne cz4
; ; ;; call proc show highlighting that is valid


; ; cz4:
; ; cmp click_flag,2
; ; jne ex3
; ; ;; call the procc that checks the if this cell is valid or not

; ; call GUI_isValid

; ex3:
; popa
; ret
;   GUI_move1 endp


;; description : proc responsible to check from the user if the clicked cell is valid or not after the click #1 
;; more details : on our game user clicks on a cell so the click_flag will become 1 then if he clicks again the click_flag will be 2 this is handled in the GUI_move function
;; this function is called only when click_flag is 2 so when this happens we will check if he chooses 1 of the cell that is highlighted or not if so it should move the piecee
;; moving logic is hadled in another proc 
; inputs: it takes row and col as an inpput only
;;output: moves the chess piece to it's new cell if valid and if not it breaks 

GUI_isValid proc
pusha

;; check the validation of the cell 

;;To Do: handle the validation 


pusha
mov al,row
mov bl,8
mul bl
add al, col
lea di, valid_cells1
mov ah, 0
add di, ax
mov bl,[di]
mov gocell,bl
popa
cmp goCell,1
jne ntv

;; valid?
call GUI_deleteObject
;; since i deleted then i'm sure i have made a move 
;; so updating the time of the cell
; call check_clear
call GUI_deHighlightValidCells
call highlight_valid_cells1
call player_switch
call highlight_valid_cells2
call player_switch
call check_inCheck
call GUI_deHighlightValidCells
call GUI_deHighlightValidCells1
call Time_generateDelay
ntv:
;; To Do we could reset isValid to zeroes 
popa
ret
 GUI_isValid endp


GUI_isValid1 proc
pusha



pusha
mov al,row1
mov bl,8
mul bl
add al, col1
lea di, valid_cells2
mov ah, 0
add di, ax
mov bl,[di]
mov gocell,bl
popa
cmp goCell,1
jne ntvv

;; valid?
call GUI_deleteObject1
;; since i deleted then i'm sure i have made a move 
;; so updating the time of the cell

;; check handle 
; call check_clear
call GUI_deHighlightValidCells1
call player_switch
call highlight_valid_cells2
call player_switch
call highlight_valid_cells1
call check_inCheck
call GUI_deHighlightValidCells1
call GUI_deHighlightValidCells
; call player_switch
; call Time_generateDelay
; call player_switch
ntvv:
;; To Do we could reset isValid to zeroes 
popa
ret
GUI_isValid1 endp


player_switchSelect proc
pusha
mov al,selectedCell_row
mov ah,selectedCell_col
mov bh,selectedCell_row1
mov selectedCell_row,bh
mov bh,selectedCell_col1
mov selectedCell_col,bh
mov selectedCell_row1,al
mov selectedCell_col1,ah
popa
ret
player_switchSelect endp



GUI_deleteObject1 proc
pusha

mov dl,row
mov dh,col


mov bh,selectedCell_row1
mov row,bh
mov bh,selectedCell_col1
mov col,bh
pusha
call get_position
popa
; ;; now we have the position of the initial cell
mov bx,pos
mov ax,25
mov rec,ax
call player_switchSelect
call GUI_getColor;; get the color
call player_switchSelect
call GUI_getObject;; get the object of the chess
call draw_cell;; draw the cells
GUI_updateBoard 0   ;; update the cell to 0 'as we deleted the object'
mov pos ,bx
mov row,dl
mov col,dh
call Player_switch
pusha
;; here we need to get the pos of the new cell and draw the piece in it
call get_position
popa
call Player_switch
pusha

mov dl,nowObject
; cmp bx,0
; jne bb


;;the logic of eating the enemy piece 
;; first get the object in this cell
;; cmp it with 0 if it is then jmp out if it is not then eat it
call Player_switch 
call GUI_getObject
call Player_switch
mov bh,nowObject
mov nowKilled,bh
cmp nowObject,0
je drr

;; the problem is that selected row and selected col is the parameters of the GUI_getColor
pusha
mov bl,selectedCell_row
mov bh,selectedCell_col
mov ah,row1
mov selectedCell_row,ah
mov ah,col1
mov selectedCell_col,ah
call GUI_getColor
mov selectedCell_row,bl
mov selectedCell_col,bh
popa
call Player_switch
pusha
call get_position;;pos is stored
popa
call Player_switch
call draw_cell

drr:
mov al,dl
call get_offset_of_piece
call draw_piece;; draw the piece
pusha
mov al,50h
call Player_switch
call highlight

popa
GUI_updateBoard dl
call Player_switch

popa
popa
ret
GUI_deleteObject1 endp


;; aboTaha procs for highlighting 







; NEEDS to be passed (row & col)
; returns (the id in piece_id)
get_piece_id proc
pusha 
mov al, row
mov bl, 8
mul bl
add al, col
lea di, chess_board
mov ah, 0
add di, ax
mov al, [di]
mov piece_id, al 
POPA
ret
get_piece_id endp

; NEEDS to be passed (cl-->my id & (row & col of the new position))
; returns (like_me_flag is set to 1 if type of me = type of other & 0 otherwise)
is_it_same proc
PUSHA
    call get_piece_id
    cmp piece_id, 0
    je con37
    cmp piece_id, 7
    jl black
    cmp cl, 7
    jnl con36
    jmp con37


    black:
        cmp cl, 7
        jl con36
        jmp con37
    con36:
    mov al, 1
    jmp o20

    con37:
        mov al, 0
    o20:
    mov like_me_flag, al
popa
ret 
is_it_same endp

; NEEDS to be passed (row & col)
; make the current cell valid for being moved to.
make_cell_valid1 proc
pusha
mov al, row
mov bl, 8
mul bl
add al, col
lea di, valid_cells1
mov ah, 0
add di, ax
mov al, 1
mov [di], al
popa
ret
make_cell_valid1 endp

; NEEDS to be passed (row & col)
; make the current cell valid for being moved to.
make_cell_valid2 proc
pusha
mov al, row
mov bl, 8
mul bl
add al, col
lea di, valid_cells2
mov ah, 0
add di, ax
mov al, 1
mov [di], al
popa
ret
make_cell_valid2 endp

; NEEDS to be passed (row & col)
; return (1 in IsValid if the cell is valid and 0 otherwise)
check_validity proc
pusha
cmp row, 7
jg notvalid
cmp row, 0
jl notvalid
cmp col, 7
jg notvalid
cmp col, 0
jl notvalid
jmp valid

notvalid:
mov al, 0
jmp con41

valid:
mov al, 1

con41:
mov IsValid, al
popa
ret
check_validity endp

; NEEDS to be passed (row & col)
; highlights all valid cells to be moved to
highlight_valid_cells1 proc
pusha

; the original row--> bl, the original col--> bh
mov bl, row
mov bh, col

; the original piece_id
call get_piece_id
mov cl, piece_id

mov ax, 25
mov rec, ax
mov al, highlighting_color1
mov color, al

; is it a rock?
; cmp cl, 1
; je con22
cmp cl, 7
je con22
jmp con21
con22:

; moves of the rock
lea di, DelX
lea si, DelY
mov ch, 4
lp11:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw1:
        cmp al, bl
        jne con23
        cmp ah, bh
        jne con23
        jmp first_move

        con23:
        call get_piece_id
        cmp piece_id, 0
        jne redraw1
        first_move:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o7
        call is_it_same
        cmp like_me_flag, 1
        je o7
        call get_position
        call draw_cell
        call make_cell_valid1
        jmp draw1

    redraw1:
        pusha
        call get_piece_id
        mov al, piece_id
        call get_offset_of_piece
        call get_position
        mov ah, highlighting_color1
        call draw_piece
        mov color, ah
        popa

    o7:
    inc di
    inc si
    dec ch
    jnz lp11
    jmp o6


con21:


; is it a knight?
; cmp cl, 2
; je con24
cmp cl, 8
je con24
jmp con25
con24:

; moves of the knight
lea di, DelX2
lea si, DelY2
mov ch, 8
lp12:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o8
    call is_it_same
    cmp like_me_flag, 1
    je o8
    call get_position
    call draw_cell
    call make_cell_valid1

    call get_piece_id
    mov al, piece_id
    cmp al, 0
    je o8
    pusha
    call get_offset_of_piece
    call get_position
    mov ah, highlighting_color1
    call draw_piece
    mov color, ah
    popa

    o8:
    inc di
    inc si
    dec ch
    jnz lp12
    jmp o6


con25:

; is it a bishop?
; cmp cl, 3
; je con26
cmp cl, 9
je con26
jmp con27
con26:

; moves of the bishop
lea di, DelX
lea si, DelY
add di, 4
add si, 4
mov ch, 4
lp13:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw2:
        cmp al, bl
        jne con28
        cmp ah, bh
        jne con28
        jmp first_move1

        con28:
        call get_piece_id
        cmp piece_id, 0
        jne redraw2
        first_move1:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o9
        call is_it_same
        cmp like_me_flag, 1
        je o9
        call get_position
        call draw_cell
        call make_cell_valid1
        jmp draw2

    redraw2:
        pusha
        call get_piece_id
        mov al, piece_id
        call get_offset_of_piece
        call get_position
        mov ah, highlighting_color1
        call draw_piece
        mov color, ah
        popa

    o9:
    inc di
    inc si
    dec ch
    jnz lp13
    jmp o6


con27:

; is it a king?
; cmp cl, 4
; je con29
cmp cl, 10
je con29
jmp con30
con29:

; moves of the king
lea di, DelX
lea si, DelY
mov ch, 8
lp14:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o10
    call is_it_same
    cmp like_me_flag, 1
    je o10
    call get_position
    call draw_cell
    call make_cell_valid1

    call get_piece_id
    mov al, piece_id
    cmp al, 0
    je o10
    pusha
    call get_offset_of_piece
    call get_position
    mov ah, highlighting_color1
    call draw_piece
    mov color, ah
    popa

    o10:
    inc di
    inc si
    dec ch
    jnz lp14
    jmp o6

con30:

; is it a queen?
; cmp cl, 5
; je con38
cmp cl, 11
je con38
jmp con39
con38:

; moves of the queen
lea di, DelX
lea si, DelY
mov ch, 8
lp15:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw3:
        cmp al, bl
        jne con40
        cmp ah, bh
        jne con40
        jmp first_move2

        con40:
        call get_piece_id
        cmp piece_id, 0
        jne redraw3
        first_move2:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o11
        call is_it_same
        cmp like_me_flag, 1
        je o11
        call get_position
        call draw_cell
        call make_cell_valid1
        jmp draw3

    redraw3:
        pusha
        call get_piece_id
        mov al, piece_id
        call get_offset_of_piece
        call get_position
        mov ah, highlighting_color1
        call draw_piece
        mov color, ah
        popa

    o11:
    inc di
    inc si
    dec ch
    jnz lp15
    jmp o6

con39:

; now we're sure it's a pawn

cmp cl ,12
jne n2

mov al, bl
mov ah, bh
dec al
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
je con55
n2:
jmp o6
con55:
call get_piece_id
cmp piece_id, 0
jne o19
call get_position
call draw_cell
call make_cell_valid1
cmp bl, 6
jne o19

dec al
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o19
call get_piece_id
cmp piece_id, 0
jne o19
call get_position
call draw_cell
call make_cell_valid1

; eating others
o19:
mov al, bl
mov ah, bh
dec al
inc ah
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o21
call get_piece_id
cmp piece_id, 7
jnl o21
cmp piece_id, 0
je o21
pusha
call get_position
call draw_cell
call make_cell_valid1
call get_piece_id
mov al, piece_id
call get_offset_of_piece
call get_position
mov ah, highlighting_color1
call draw_piece
mov color, ah
popa

o21:

mov al, bl
mov ah, bh
dec al
dec ah
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o6
call get_piece_id
cmp piece_id, 7
jnl o6
cmp piece_id, 0
je o6
pusha
call get_position
call draw_cell
call make_cell_valid1
call get_piece_id
mov al, piece_id
call get_offset_of_piece
call get_position
mov ah, highlighting_color1
call draw_piece
mov color, ah
popa

o6:
mov row, bl
mov col, bh
popa
ret
highlight_valid_cells1 endp
; NEEDS to be passed (row & col)
; highlights all valid cells to be moved to
highlight_valid_cells2 proc
pusha

; the original row--> bl, the original col--> bh
mov bl, row
mov bh, col

; the original piece_id
call get_piece_id
mov cl, piece_id

mov ax, 25
mov rec, ax
mov al, highlighting_color2
mov color, al

; is it a rock?
cmp cl, 1
je con42
; cmp cl, 7
; je con42
jmp con43
con42:

; moves of the rock
lea di, DelX
lea si, DelY
mov ch, 4
lp16:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw4:
        cmp al, bl
        jne con44
        cmp ah, bh
        jne con44
        jmp first_move3

        con44:
        call get_piece_id
        cmp piece_id, 0
        jne o12
        first_move3:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o12
        call is_it_same
        cmp like_me_flag, 1
        je o12
        call make_cell_valid2
        jmp draw4

    o12:
    inc di
    inc si
    dec ch
    jnz lp16
    jmp o13


con43:


; is it a knight?
cmp cl, 2
je con45
; cmp cl, 8
; je con45
jmp con46
con45:

; moves of the knight
lea di, DelX2
lea si, DelY2
mov ch, 8
lp17:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o14
    call is_it_same
    cmp like_me_flag, 1
    je o14
    call make_cell_valid2

    call get_piece_id
    mov al, piece_id
    cmp al, 0
    je o14

    o14:
    inc di
    inc si
    dec ch
    jnz lp17
    jmp o13


con46:

; is it a bishop?
cmp cl, 3
je con47
; cmp cl, 9
; je con47
jmp con48
con47:

; moves of the bishop
lea di, DelX
lea si, DelY
add di, 4
add si, 4
mov ch, 4
lp18:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw5:
        cmp al, bl
        jne con53
        cmp ah, bh
        jne con53
        jmp first_move4

        con53:
        call get_piece_id
        cmp piece_id, 0
        jne o15
        first_move4:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o15
        call is_it_same
        cmp like_me_flag, 1
        je o15
        call make_cell_valid2
        jmp draw5

    o15:
    inc di
    inc si
    dec ch
    jnz lp18
    jmp o13


con48:

; is it a king?
cmp cl, 4
je con49
; cmp cl, 10
; je con49
jmp con50
con49:

; moves of the king
lea di, DelX
lea si, DelY
mov ch, 8
lp19:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o16
    call is_it_same
    cmp like_me_flag, 1
    je o16
    call make_cell_valid2

    call get_piece_id
    mov al, piece_id
    cmp al, 0
    je o16

    o16:
    inc di
    inc si
    dec ch
    jnz lp19
    jmp o13

con50:

; is it a queen?
cmp cl, 5
je con51
; cmp cl, 11
; je con51
jmp con52
con51:

; moves of the queen
lea di, DelX
lea si, DelY
mov ch, 8
lp20:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    draw6:
        cmp al, bl
        jne con54
        cmp ah, bh
        jne con54
        jmp first_move5

        con54:
        call get_piece_id
        cmp piece_id, 0
        jne o17
        first_move5:
        add al, [di]
        add ah, [si]
        mov row, al
        mov col, ah
        call check_validity
        cmp IsValid, 0
        je o17
        call is_it_same
        cmp like_me_flag, 1
        je o17
        call make_cell_valid2
        jmp draw6

    o17:
    inc di
    inc si
    dec ch
    jnz lp20
    jmp o13

con52:

; now we're sure it's a pawn
cmp cl,6
jne n1
mov al, bl
mov ah, bh
inc al
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
je con56
n1:
jmp o13
con56:
call get_piece_id
cmp piece_id, 0
jne o22
call make_cell_valid2
cmp bl, 1
jne o22
inc al
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o22
call get_piece_id
cmp piece_id, 0
jne o22
call make_cell_valid2

; eating others
o22:
mov al, bl
mov ah, bh
inc al
inc ah
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o23
call get_piece_id
cmp piece_id, 7
jl o23
cmp piece_id, 0
je o23
call make_cell_valid2

o23:

mov al, bl
mov ah, bh
inc al
dec ah
mov row, al
mov col, ah
call check_validity
cmp IsValid, 1
jne o13
call get_piece_id
cmp piece_id, 7
jl o13
cmp piece_id, 0
je o13
call make_cell_valid2

o13:
mov row, bl
mov col, bh
popa
ret
highlight_valid_cells2 endp

highlight_valid_cells macro
pusha
call get_piece_id
cmp piece_id, 7
jl highlight_black
call highlight_valid_cells1
jmp o18
highlight_black:
call highlight_valid_cells2
o18:
popa
endm highlight_valid_cells 



;NEEDS to be passed (row & col)
;NEEDS to be passed (row & col)
get_position proc  ;position is stored in pos
    pusha
    mov ah, 0
    mov al, row
    mov cx, 25
    mul cx
    mov dx, 320
    mul dx
    mov bx, ax
    mov ah, 0
    mov al, col
    mov cx, 25
    mul cx
    add ax, bx
    mov pos, ax
    popa
    ret
get_position endp
; NEEDS to be passed (color & pos)
draw_pixel proc ; pos is the position and rec is the recurrence of the line
    PUSHA
    
    mov ax, 0A000h
    mov es, ax

    mov di, pos
    mov al, color ; color
    mov cx, 1
    rep stosb

    POPA
    ret
draw_pixel endp

; NEEDS to be passed (color & rec & pos)
draw_line proc ; pos is the position and rec is the recurrence of the line
    PUSHA
    
    mov ax, 0A000h
    mov es, ax

    mov di, pos
    mov al, color ; color
    mov cx, rec
    rep stosb

    POPA
    ret
draw_line endp

; NEEDS to be passed (pos is the left-top pixel position)
draw_cell proc
PUSHA
mov cx, 25
mov bx,pos
lp:
    call draw_line
    mov ax, pos
    add ax, 320
    mov pos, ax

loop lp
mov pos,bx
POPA
ret
draw_cell endp

; NEEDS to be passed (row, col, al--> color)
highlight proc
PUSHA
call get_position
mov dx, pos
mov cx, 5
mov rec, cx
mov color, al
call draw_line
mov pos, dx
mov ax, pos
add ax, 20
mov pos, ax
call draw_line
mov pos, dx
mov ax, pos
add ax, 7680
mov pos, ax
call draw_line
mov pos, dx
mov ax, pos
add ax, 7700
mov pos, ax
call draw_line
mov pos, dx
mov cl, 5
lp7:
call draw_pixel
mov ax, pos
add ax, 320
mov pos, ax
loop lp7

mov pos, dx
mov ax, pos
add ax, 24
mov pos, ax
mov cl, 5
lp8:
call draw_pixel
mov ax, pos
add ax, 320
mov pos, ax
loop lp8

mov pos, dx
mov ax, pos
add ax, 6400
mov pos, ax
mov cl, 5
lp9:
call draw_pixel
mov ax, pos
add ax, 320
mov pos, ax
loop lp9

mov pos, dx
mov ax, pos
add ax, 6424
mov pos, ax
mov cl, 5
lp10:
call draw_pixel
mov ax, pos
add ax, 320
mov pos, ax
loop lp10

mov pos, dx
POPA
ret
highlight endp

inverse_highlight proc
PUSHA

;;this is just handling if the 2 cursor meets at each other and one moved 
;;then other cursor should be displayed
curMeet:
;; check for the meet first row=row1 and col = col1
mov bh,row
cmp row1,bh
jne ll1
mov bh,col
cmp col1,bh
jne ll1
;; didn't jump ?  then draw the other cursor 
;; draw row1 and col1

cmp nowPlayer,1
jne cur1
mov al,cursorColor2
jmp nb
cur1:
mov al,cursorColor1
nb:
; call player_switch
call highlight
; call player_switch
jmp nx

;; if the row and col is in a valid_cells 1 then the color is the highlighting color of 1
;; if the row and col is in a valid cells 2 then the color is the highlighting of 2 
;; To Do : handle if te rowand col is in both valid cells 1 and 2

;; handle moving on the highlight proc 
ll1:
call GUI_isHighlighted
cmp isLighted_flag,1
jne ll4
mov al,highlighting_color1
jmp o5

; ll2:
; cmp isLighted_flag,2
; jne ll3
; mov al,highlighting_color2
; jmp o5

; ll3:
; cmp isLighted_flag,3
; jne ll4
; ;; cover highlighting color for both 
; mov al,highlighting_colorBoth
; jmp o5


ll4:
cmp isLighted_flag,4
jne ll5
mov al,check_color
jmp o5


ll5:
cmp isLighted_flag,5
jne ord
mov al,checkMate_color
jmp o5


ord:
mov al, row
add al, col
mov ah, al
shr al, 1
shl al, 1
cmp al, ah
je ev
mov al, 19H
jmp o5

ev:
mov al, 68h

o5:
mov color, al
call highlight
nx:
POPA
ret
inverse_highlight endp


draw_grid proc
PUSHA
mov bl, 0
mov al, 68h
mov color, al
lp1:
    mov bh, 0
    mov row, bl
    mov col, bh
    lp2:
        mov col, bh
        call get_position
        call draw_cell
        cmp al, 68H
        je grey
        mov al, 68h
        mov color, al
        jmp con

        grey:
        mov al, 19h
        mov color, al
        con:
        inc BH
        cmp bh, 8
        je con2
        jmp lp2
    con2:
        inc BL
        cmp bl, 8
        je o
        cmp al, 68H
        je grey2
        mov al, 68h
        mov color, al
        jmp con3

        grey2:
        mov al, 19h
        mov color, al
        con3:
        jmp lp1

o:
POPA
ret
draw_grid endp

;NEEDS to be passed (pos & offset in bx)
draw_piece proc
PUSHA
mov cl, 0
mov dx, pos
mov ax, pos
add ax, 642
mov pos, ax
lp3:
    mov ch, 0
    lp4:
        mov al, [bx]
        cmp al, 0FFH
        je conn
        mov color, al
        call draw_pixel
        conn:
        inc ch
        inc BX
        cmp ch, 20
        je con4
        mov ax, pos
        inc ax
        mov pos, ax
        jmp lp4

    con4:
    mov ax, pos
    add ax, 301
    mov pos, ax
    inc cl
    cmp cl, 20
    je o2
    jmp lp3


o2:
mov pos, dx
POPA
ret
draw_piece endp

;NEEDS to be passed (al--> value, bx--> offset)
get_offset_of_piece proc
mov ah, 0
cmp ax, 0
jne con5
mov bx, 0
jmp o3
con5:

cmp ax, 1
jne con6
lea bx, black_rock
jmp o3
con6:

cmp ax, 2
jne con7
lea bx, black_knight
jmp o3
con7:

cmp ax, 3
jne con8
lea bx, black_bishop
jmp o3
con8:

cmp ax, 4
jne con9
lea bx, black_king
jmp o3
con9:

cmp ax, 5
jne con17
lea bx, black_queen
jmp o3
con17:

cmp ax, 6
jne con10
lea bx, black_pawn
jmp o3
con10:

cmp ax, 7
jne con11
lea bx, white_rock
jmp o3
con11:

cmp ax, 8
jne con12
lea bx, white_knight
jmp o3
con12:

cmp ax, 9
jne con13
lea bx, white_bishop
jmp o3
con13:

cmp ax, 10
jne con14
lea bx, white_king
jmp o3
con14:

cmp ax, 11
jne con15
lea bx, white_queen
jmp o3
con15:

cmp ax, 12
jne con16
lea bx, white_pawn
jmp o3
con16:

o3:
ret
get_offset_of_piece endp
    

GUI_validForBoth proc
pusha
mov dl,row
mov dh,col

lea di,valid_cells1
lea si,valid_cells2
mov cx,0
again3:
mov bh,[di]
mov bl,[si]
cmp bh,1
jne goout
cmp bl,1 
jne goout
; all you need is to rehighlight only 
; GUI_deHighlightValidCells
get_cellLocation cx
pusha
call get_position
popa
mov al,highlighting_colorBoth
mov color,al
mov ax,25
mov rec,ax
call draw_cell
call GUI_getObject
;; object is stored in now object 
cmp nowObject,0
je goout
;; we have an object
pusha
mov al,nowObject
call get_offset_of_piece
call draw_piece
popa
goout:
inc si
inc di
inc cx
cmp cx,64
jne again3
mov row,dl
mov col,dh

popa
ret
GUI_validForBoth endp


;;author: KORE

;; Time Module 
;; time procs


;; time is stored 
;; nowSecond : seconds
;; nowMin : min 
;; note we don't store the hours so every hours we could have an error of time handling 
;; can be handled later we just checking the main logic 

Time_getSystemTime proc
pusha
mov ah,2Ch
int 21h
;; dh: seconds , Cl= mins
mov nowSecond,dh
mov nowMin,cl
popa
ret
Time_getSystemTime endp

;; desc : proc takes row and col and returns the index 
;; index is stored in nowIndex
getIndex proc
pusha
mov al,row
mov ah,0
mov bh,8
MUL bh
mov bh,col
add al,bh
mov nowIndex,al
popa
ret
getIndex endp
;;description: it updates the cell of the current row and col to the next time it can move on second  
;;inputs : row and col
Time_generateDelay proc
pusha
call Time_getSystemTime
mov al,nowMin
mov ah,0
;; transfer min to second
mov bh,60
MUL bh

mov bl,nowSecond
mov bh,0
add ax,bx
;; now our time is stored in ax 
lea di,cellsTimer
call getIndex
mov bl,nowIndex
mov bh,0
add di,bx
mov [di],ax;;updated
popa
ret
Time_generateDelay endp



;; desc: proc checks if the current row and col can move or not 
;; inputs row and col
Time_canMove proc
pusha
lea di,cellsTimer
call getIndex
mov bl,nowIndex
mov bh,0
add di,bx
mov bh,0
cmp [di],bh;; initial 
jne mx
mov bh,1
mov canMove_flag,1
jmp pz
mx:
call Time_getSystemTime
mov al,nowMin
mov ah,0
;; transfer min to second
mov bh,60
MUL bh

mov bl,nowSecond
mov bh,0
add ax,bx
;; now our time is stored in ax 
SUB ax,[di]
cmp ax,3
jb notnow
mov bh,1
mov canMove_flag,bh
jmp pz
notnow:
mov bh,0
mov canMove_flag,bh

pz:
popa
ret
Time_canMove endp
;; check&checkmate module

;; both king pos is stored in the 2 bytes king1Pos and king2Pos
;; stores also row and col if needed
check_getKingsPos proc
pusha
mov dl,row
mov dh,col
lea di, chess_board
mov cx,0 
find:
mov bh,10
cmp [di],bh;; king 1 id
jne king2
 get_cellLocation cx
mov bh,row
mov King1_row,bh
mov bh,col
mov king1_col,bh
call get_position
mov bx,pos
mov king1Pos,bx

king2:
mov bh,4
cmp [di],bh;; king 2 id 
jne loi
 get_cellLocation cx
 mov bh,row
 mov King2_row,bh
 mov bh,col
 mov King2_col,bh
call get_position
mov bx,pos
mov king2Pos,bx
loi:
inc cx
inc si
inc di
cmp cx,64
jne find 


mov row,dl
mov col,dh
popa
ret
check_getKingsPos endp
;; desc : a proc that updates the color of the king's cells if there is a check or a checkmate 

check_clear proc
pusha 
mov dl,row
mov dh,col
call check_getKingsPos;; get king pos
mov bh,King1_row
mov row,bh
mov bh,king1_col
mov col,bh
call GUI_getNowColor
mov bx,king1Pos
mov pos,bx
mov ax,25
mov rec,ax
call draw_cell
mov al,10;; white king id
call get_offset_of_piece
mov cx ,king1Pos
mov pos,cx
call draw_piece

call check_getKingsPos;; get king pos
mov bh,King2_row
mov row,bh
mov bh,king2_col
mov col,bh
call GUI_getNowColor
mov bx,king2Pos
mov pos,bx
mov ax,25
mov rec,ax
call draw_cell
mov al,4;; white king id
call get_offset_of_piece
mov cx ,king2Pos
mov pos,cx
call draw_piece
mov row,dl
mov col,dh
popa
ret




check_clear endp








check_update proc
pusha
; mov dx,pos
mov dl,row
mov dh,col
;; check the white king checkmate
cmp whiteking_in_checkmate,1
jne wc
pusha
call check_getKingsPos;; get king pos
mov bx,king1Pos
mov pos,bx
mov al,checkMate_color
mov color,al
call draw_cell
mov al,10;; white king id
call get_offset_of_piece
mov cx ,king1Pos
mov pos,cx
call draw_piece
popa
jmp bcm
wc:

cmp whiteking_in_check,1
jne res1
call check_getKingsPos;; get king pos
mov bx,king1Pos
mov pos,bx
mov al,check_color
mov color,al
call draw_cell
mov al,10;; white king id
call get_offset_of_piece
mov cx ,king1Pos
mov pos,cx
call draw_piece
jmp bcm


res1:
call check_getKingsPos;; get king pos
mov bh,King1_row
mov row,bh
mov bh,king1_col
mov col,bh
call GUI_getNowColor
mov bx,king1Pos
mov pos,bx
mov ax,25
mov rec,ax
call draw_cell
mov al,10;; white king id
call get_offset_of_piece
mov cx ,king1Pos
mov pos,cx
call draw_piece




bcm:
cmp blackking_in_checkmate,1
jne bc

call check_getKingsPos;; get king pos
mov bx,king2Pos
mov pos,bx
mov al,checkMate_color
mov color,al
call draw_cell
mov al,4;; black king id
call get_offset_of_piece
mov cx ,king2Pos
mov pos,cx
call draw_piece
jmp mm
bc:
cmp blackking_in_check,1
jne res2
call check_getKingsPos;; get king pos
mov bx,king2Pos
mov pos,bx
mov al,check_color
mov color,al
call draw_cell
mov al,4;; white king id
call get_offset_of_piece
mov cx ,king2Pos
mov pos,cx
call draw_piece
jmp mm


res2:
call check_getKingsPos;; get king pos
mov bh,King2_row
mov row,bh
mov bh,king2_col
mov col,bh
call GUI_getNowColor
mov bx,king2Pos
mov pos,bx
call draw_cell
mov al,4;; white king id
call get_offset_of_piece
mov cx ,king2Pos
mov pos,cx
call draw_piece






mm:
mov pos,dx
mov bh,0
mov whiteking_in_check,bh
mov whiteking_in_checkmate,bh
mov blackking_in_check,bh
mov blackking_in_checkmate,bh


mov row,dl
mov col,dh
popa
ret
check_update endp
;; author: abo taha 


;; description : a proc the raises the flags whenever there is a check 

check_inCheck proc
pusha
mov dl,row
mov dh,col


; checking if white king is in check
lea di, chess_board
mov ah, 0 ; the position of the king
lp21:
    mov al, [di]
    cmp al, 10
    je o24
    inc di
    inc ah
    jmp lp21
o24:
lea di, valid_cells2
mov al, ah
mov ah, 0
add di, Ax
mov al, [di]
mov whiteking_in_check, al


; checking if black king is in check
lea di, chess_board
mov ah, 0 ; the position of the king
lp22:
    mov al, [di]
    cmp al, 4
    je o25
    inc di
    inc ah
    jmp lp22
o25:
lea di, valid_cells1
mov al, ah
mov ah, 0
add di, Ax
mov al, [di]
mov blackking_in_check, al


; checking if the white king is in check mate
lea di, chess_board
mov ax, 0 ; the position of the king
lp23:
    mov bl, [di]
    cmp bl, 10
    je o26
    inc di
    inc ax
    jmp lp23
o26:
mov bl, 8
div bl
mov bl, al
mov bh, ah

; moves of the king
lea di, DelX
lea si, DelY
mov ch, 8
mov cl, 1 ; if there is any valid cells for the king it's a 0 otherwise 1
lp24:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o27
    call get_piece_id
    cmp piece_id, 0
    jne o27
    mov cl, 0

    o27:
    inc di
    inc si
    dec ch
    jnz lp24
    jmp o28

o28:

AND cl,whiteking_in_check
mov whiteking_in_checkmate, cl

; checking if the black king is in check mate
lea di, chess_board
mov ax, 0 ; the position of the king
lp26:
    mov bl, [di]
    cmp bl, 4
    je o30
    inc di
    inc ax
    jmp lp26
o30:
mov bl, 8
div bl
mov bl, al
mov bh, ah

; moves of the king
lea di, DelX
lea si, DelY
mov ch, 8
mov cl, 1 ; if there is any valid cells for the king it's a 0 otherwise 1
lp25:
    ; the changing coordinates
    mov al, bl
    mov ah, BH
    add al, [di]
    add ah, [si]
    mov row, al
    mov col, ah
    call check_validity
    cmp IsValid, 0
    je o31
    call get_piece_id
    cmp piece_id, 0
    jne o31
    mov cl, 0

    o31:
    inc di
    inc si
    dec ch
    jnz lp25
    jmp o29

o29:
AND cl,blackking_in_check
mov blackking_in_checkmate, cl

mov row,dl
mov col,dh 
popa
ret
check_inCheck endp






;;author: KORE

;; Status Module 
;; Status procs

Status_init proc
pusha
;; store youur row and col
mov dl,row
mov dh, col

;; now we need to draw our status GUI first
mov bl,0 
mov row,bl
mov bh,8
mov col,bh

;; now we need to draw 

ob:
call get_position
mov ax,25
mov rec,ax
mov al,Status_gridColor
mov color,al
call draw_cell
inc bh
mov col,bh
cmp col,10
jne ob
cmp row,7
je k5
;; reset your col 
mov bh,8
mov col,bh 
inc bl
mov row,bl 
loop ob
k5:
;; need to restore row and col 
mov row,dl
mov col,dh
popa
ret
Status_init endp




Status_update proc 
pusha
mov dl,row
mov dh,col

cmp nowKilled,4
jne wt
mov bh,1
mov winner_flag,bh
jmp nk
wt:
cmp nowKilled,10
jne nk
mov bh,2
mov winner_flag,bh
nk:
cmp nowKilled,0 
je ps
;; there is something killed need to be drawn 
;; if he is less than 7 then he is player 2 killed 
;; if he is else then he is player 1 

cmp Status_col,10
jne old2
call Status_reset
mov bh,Status_row
mov row,bh
mov bh,Status_col
mov col,bh
call get_position
mov al,nowKilled
call get_offset_of_piece
call draw_piece
jmp ps

old2:
mov bh,Status_row
mov row,bh
mov bh,Status_col
mov col,bh
call get_position
mov al,nowKilled
call get_offset_of_piece
call draw_piece

;;handle incrementing 
mov bh,Status_row
inc bh
cmp bh,8
je mv
;; ez incrmentt
mov Status_row,bh
jmp ps 
mv:
mov bh,0
mov Status_row,bh
mov bh,Status_col
inc bh 
;;call status_reset
mov Status_col,bh
ps:
mov row,dl
mov col,dh
mov bh,0
mov nowKilled,bh
popa
ret
Status_update endp



Status_reset proc
pusha
mov dl,row
mov dh,col


;; now we need to draw our status GUI first
mov bl,0 
mov row,bl
mov bh,8
mov col,bh

;; now we need to draw 

ob1:
call get_position
mov ax,25
mov rec,ax
mov al,Status_gridColor
mov color,al
call draw_cell
inc bh
mov col,bh
cmp col,10
jne ob1
cmp row,7
je k6
;; reset your col 
mov bh,8
mov col,bh 
inc bl
mov row,bl 
loop ob1

k6:
mov bh,0
mov Status_row,bh
mov bh,8
mov Status_col,bh
mov row,dl
mov col,dh
popa
ret

Status_reset endp



; ;; description : takes row as an input and returns the coresspinding row in player 2 screen
; ;; row is stored in sent_row  
; GUI_flip proc 
; pusha 
; ;; logic:   7-row 
; mov bl,row 
; mov al,7
; sub al,bl 
; mov TRA_row,al
; popa
; ret
; GUI_flip endp


;; game communication module

;; descritption : this proc takes action as an input and if there is a move happend by the player it sends it throught the UART COM
;; inputs : action 
;; returns the action to the second player device

GAME_sendAction proc 
pusha
;; checks if there is an action to  take  
cmp TRA_action,-1;; indication that there is no action taken 
je noAction
;; there is an action taken so we need to send the action through UART
mov bl,TRA_action 
mov VALUE,bl
call UART_transmit;; action is transmitted 


noAction:
mov bl,-1
mov TRA_action ,bl
popa
ret
GAME_sendAction endp

;; description: a proc that takes the action done at thee moment from the second player
;; stores the action in REC_action  



GAME_recieveAction proc
;; maybe we need to store the row and col 

pusha 


call UART_rec
;; check about the rec_bool
cmp rec_bool,1
jne noProc
cmp VALUE,2
jne actt
av:

call UART_rec
cmp rec_bool,0
je av
mov bh,0
mov rec_bool,bh
call INChat_printRecieved
jmp noProc


actt:
mov bl,VALUE
mov REC_action,bl
jmp recEx



noProc:
mov bl,-1
mov REC_action,bl
recEX:
popa
ret
GAME_recieveAction endp


;; inGame chat Module 






INChat_init proc
pusha
mov bh,32
mov shift,bh

mov bh,1
mov player1_start,bh
mov last1_back,bh
mov bh,14
mov player2_start,bh
mov last2_back,bh
mov bh,9
mov player1_end,bh
mov bh,22
mov player2_end,bh

 mov bh,player1_start
mov last1_row,bh
mov bh,player2_start
mov last2_row,bh
mov bh,shift
mov last1_col,bh
mov last2_col,bh


mov bh,32
mov cur,bh
mov bh,11
mov cur+1,bh
call SET_CURSOR
print rr1
mov bh,32
mov cur,bh
mov bh,12
mov cur+1,bh
call SET_CURSOR
print str1
mov bh,32
mov cur,bh
mov bh,0
mov cur+1,bh
call SET_CURSOR
print str2

popa
ret
INChat_init endp


INChat_player1Clear proc 
pusha
;;clearing by drawing black cells
mov ax,0600h
mov cl,32
mov bh,0
mov ch,1
mov dx,0A27H
int 10h
;; cursor scroll handle 

mov bh,shift
mov cur,bh
mov last1_col,bh
mov bh,player1_start
mov cur+1,bh
mov last1_row,bh
call SET_CURSOR
mov bh,player1_start
mov last1_back,bh


popa
ret
INChat_player1Clear endp



INChat_player2Clear proc
pusha
mov ax,0600h
mov cl,32
mov bh,0
mov ch,13
mov dx,1627H
int 10h


mov bh,shift
mov cur,bh
mov last2_col,bh
mov bh,player2_start
mov cur+1,bh
mov last2_row,bh
call SET_CURSOR
mov bh,player2_start
mov last2_back,bh
mov bh,0
mov inChat_flag,bh
popa
ret
INChat_player2Clear endp

INChat_sendChat proc
pusha

cmp nowChat,-1
je kpp
;; reset cursor to my side
mov bh,last1_col
  mov cur,bh
  mov bh,last1_row
  mov cur+1,bh
  call SET_CURSOR

;; no bug handeled 
call CURSOR_getPosition
mov bh,2
mov VALUE,bh
call UART_transmit
mov bh,nowChat
mov VALUE,bh
call UART_transmit
; enter handling 

cmp al,8
je kpp

enm:
cmp al,13
jne inPrint

mov bh,cur+1
inc bh
mov cur+1,bh
mov bh,player1_end
cmp cur+1,bh
jne nost
call INChat_player1Clear

kpp:
jmp outsend4


nost:
mov bh,shift
mov last1_col,bh
mov cur,bh
mov bh,cur+1
mov last1_row,bh
call SET_CURSOR
jmp outsend4

inPrint:
call CURSOR_getPosition


cmp cur,39
jne avd5
mov bh,player1_end
cmp cur+1,bh
jne newline
call INChat_player1Clear

newline:
mov bh,32
mov cur,bh
mov bh,cur+1
inc bh
mov cur+1,bh
call SET_CURSOR
avd5:

print_char nowChat 
call CURSOR_getPosition
mov bh,cur
mov last1_col,bh
mov bh,cur+1
mov last1_row,bh


outsend4:
mov bh,-1
mov nowChat,bh
popa
ret
INChat_sendChat endp

INChat_printRecieved proc
pusha

; cmp inChat_flag,1
; je po

; call UART_rec;; now you have your char to print 
; cmp rec_bool,1
; jne noI
;             mov bh,0  
;             mov rec_bool,bh
; cmp VALUE,2;; 2 is start of chat
; je noI
; mov bh,VALUE
; mov REC_action,bh
; mov bh,1
; mov game_flag,1
; jmp noI
; ;; polling delay 
; del:
; call UART_rec
; cmp rec_bool,1
; jne del
;             mov bh,0  
;             mov rec_bool,bh
          po:
              
        ;   mov bh,0
        ;   mov inChat_flag,bh
            mov bh,last2_col
            mov cur,bh
            mov bh,last2_row
            mov cur+1,bh
            call SET_CURSOR
enk:;;enter logic



call CURSOR_getPosition

 cmp cur,39
jne avf
mov bh,player2_end
   cmp cur+1,bh
    jne newline1
    call INChat_player2Clear   
    jmp avf
           newline1:
          mov bh,32
          mov cur,bh
          mov bh,cur+1
          inc bh
          mov cur+1,bh
          call SET_CURSOR
           avf:
           print_char VALUE
           call CURSOR_getPosition
                  mov bh,cur
            mov last2_col,bh
            mov bh,cur+1
            mov last2_row,bh
noI:
popa
ret

INChat_printRecieved endp


conGame PROC

    resett:
    mov ah,0
    int 16h 
    cmp ah,28;; scan code of ENTER
    jne resett
    call resetAllData
    jmp back

ret
conGame endp
    


show_winner PROC

    mov ah,0
    mov al,03h
    int 10h 

    mov bh, winner_flag
    cmp bh, 1
    je p1Won
    
    mov cur,35
    mov cur+1,8
    call SET_CURSOR
    print user2

    mov cur,35
    mov cur+1,10
    call SET_CURSOR
    print wonText

    mov cur,35
    mov cur+1,12
    call SET_CURSOR
    print validName


    call conGame

    jmp dnWinner

    p1Won:
    mov cur,35
    mov cur+1,8
    call SET_CURSOR
    print iwon
    
    mov cur,35
    mov cur+1,10
    call SET_CURSOR
    print wonText

    mov cur,35
    mov cur+1,12
    call SET_CURSOR
    print validName


    call conGame
    
    
    dnWinner:
    ret

show_winner endp

checkWinner PROC
PUSHA
mov bh, winner_flag
cmp bh, 0
POPA
je con_game
call show_winner
con_game:
ret
checkWinner endp


resetAllData PROC
PUSHA

lea si, chess_board
lea di, chess_board_original

mov cx, 64
clearBoard:

    mov ah, [di]
    mov [si], ah

    inc si
    inc di

loop clearBoard

mov ah, 0
mov click_flag, ah
mov winner_flag, ah
mov Status_row, ah
mov nowKilled, ah
mov whiteking_in_check, 0
mov blackking_in_check, 0
mov whiteking_in_checkmate, 0
mov blackking_in_checkmate, 0


mov ah, 8
mov Status_col, ah

mov cx, 64
lea si, valid_cells1
lea di, valid_cells2
lea bx, cellsTimer
clearValidCells:

    mov ah, 0
    mov [si], ah
    mov [di], ah
    mov [bx], ah

    inc si
    inc di
    inc bx

loop clearValidCells


POPA
ret
resetAllData endp




GameMode PROC 

    PUSHA


    ;clear screen
    mov ax, 3 
    int 10h

call resetAllData
    ;get to graphics mode
    mov ah, 0
    mov al ,13h
    int 10h
               
    mov Ax, 25
    mov rec, ax
    call draw_grid

  
    ; drawing pieces
    mov bl, 0
    mov al, 68h
    mov color, al
    lea si, chess_board
    lp5:
        mov bh, 0
        mov row, bl
        lp6:
            mov col, bh
            push bx
            call get_position
            mov al, [si]
            inc si
            call get_offset_of_piece
            cmp bx, 0
            je con19
            call draw_piece
            con19:
            pop bx
            inc BH
            cmp bh, 8
            je con18
            jmp lp6
        con18:
            inc BL
            cmp bl, 8
            je o4
            jmp lp5

    o4:



;KORE TESTING

;; initial state of the game
pusha
mov bh,0
mov row1,bh
mov bh,0
mov col1,bh
call Player_switch 
mov al,4
call highlight
call Player_switch



mov bh,7
mov row,bh
mov bh,0
mov col,bh
mov bh,0
mov click_flag,bh
mov click_flag1,bh
mov al,7
call highlight
popa
; main game play

mov bh,0
mov go_main,bh

call Status_init
mov bl,-1
mov REC_action,bl
mov TRA_action,bl


call INChat_init
; call INChat_player2Clear





play:
cmp go_main,1
je nm

call GAME_recieveAction
call GUI_move2
 call Status_update

call checkWinner
mov bh, winner_flag
cmp bh, 0
jne goOutGame



cha:
; call INChat_recieveChat
 call GUI_move1
 call INChat_sendChat
 call Status_update
 call GAME_sendAction

call checkWinner
mov bh, winner_flag
cmp bh, 0
jne goOutGame

jmp play


goOutGame:
mov ah,0
int 16h
nm:
mov bh,0
mov stage,bh


    POPA
    ret

GameMode endp






CHAT_GO PROC
pusha

call CHAT_init 

chat:
cmp exitChat_bool,1
je mcc
call CHAT_printRecieved
            ;; check if somthing is be transmitted

call CHAT_sendChat

mov al,0
outchat:
;; clearing the buffer 
mov ah, 6
	mov dl, 255
	int 21h 

jmp chat
;;loop
mcc:
mov bh,0
mov stage,bh
popa
ret 
CHAT_GO endp









MAIN PROC FAR
    MOV AX,@DATA
    MOV DS, AX 

    ;clear screen
    mov bh,0
mov lastStage,0
call UART_init


call MAINSCREEN_init

; wait for used pressed key so we should compare it with enter scan code
back:
call UI_init
; after calling UI_init stage will have a value between 1-->> 3 indicating the stage the user wished 
cmp stage,1;; means user wanted to chat
jne com1
call CHAT_GO

com1:
cmp stage,0;; back to UI screen
je back
 com2:
 cmp stage,2
jne e__
call GameMode
jmp back

e__:
;; we need to write a command to close the window here as the user pressed ESC




 
    main endp 
END MAIN
    
    
    