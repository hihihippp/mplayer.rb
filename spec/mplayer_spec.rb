require 'spec_helper'

describe MPlayer do
  before :each do
    @mplayer = MPlayer.new
  end

  describe "#new" do
    it 'returns a new MPlayer-object' do
      @mplayer.should be_an_instance_of MPlayer
    end

    it 'creates a file, whichs path is described in the fifo-option' do
      fifo_file= @mplayer.instance_variable_get(:@options)[:fifo]
      File.exists?(fifo_file).should be_true
    end

    it 'creates a file, whichs path is described in the logfile-option' do
      logfile = @mplayer.instance_variable_get(:@options)[:logfile]
      File.exists?(logfile).should be_true
    end
  end

  describe "#player_pid" do
    it 'returns a fixnum' do
      @mplayer.player_pid.should be_an_instance_of Fixnum
    end

    it 'returns a pid of a mplayer-process' do
      `pidof mplayer`.should include @mplayer.player_pid.to_s
    end
  end

end